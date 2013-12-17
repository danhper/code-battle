# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  name                   :string(255)
#  username               :string(255)
#

class User < ActiveRecord::Base
  include GravatarImageTag

  ROLES = %w[normal moderator admin]

  devise :database_authenticatable, :rememberable, :trackable
  devise :omniauthable, omniauth_providers: [:github]

  has_and_belongs_to_many :guilds,
                          -> { uniq },
                          join_table: 'user_guilds'

  has_and_belongs_to_many :likes,
                          -> { uniq },
                          join_table: 'user_like_codes',
                          class_name: 'Code',
                          after_add: Proc.new { |u, c| c.increment_likes_counter! },
                          after_remove: Proc.new { |u, c| c.decrement_likes_counter! }

  scope :last_registered, -> { limit(16).order(created_at: :desc) }

  has_many :votes
  has_many :quests, through: :votes

  has_many :created_quests, class_name: 'Quest', foreign_key: :creator_id
  has_many :created_codes, class_name: 'Code', foreign_key: :user_id

  has_many :comments

  has_many :current_battles, class_name: 'Gladiator'

  validates :username, uniqueness: true, allow_nil: true, length: { in: 1..255 }

  def role?(base_role)
    return false if self.id.nil?
    ROLES.index(base_role.to_s) <= ROLES.index(self.role)
  end

  def in_guild?(guild)
    guilds.exists?(guild)
  end

  def likes_code?(code)
    likes.exists?(code) ? true : false
  end

  def votes_quest?(quest)
    quests.exists?(quest) ? true : false
  end

  def votes_guild?(quest, guild)
    votes.where(quest_id: quest.id, guild_id: guild).exists? ? true : false
  end

  def codes_for_quest(quest)
    self.created_codes.where(quest_id: quest)
  end

  def code_for_quest(quest)
    self.codes_for_quest(quest).first
  end

  def wrote_code?(quest)
    self.codes_for_quest(quest).exists? ? true : false
  end

  def large_guild
    self.guilds.max{|x,y| x.users.count <=> y.users.count}
  end

  def as_json(options={})
    super({ only: [:id, :username] }.merge(options))
  end

  def gravatar_url
    GravatarImageTag.gravatar_url self.email
  end

  def language_usage_statistics
    total_codes_count = self.created_codes.count
    codes_per_guild = self.created_codes.includes(:guild).group(:guild).count
    statistics = []
    codes_per_guild.each do |guild, count|
      statistics << guild.as_json.merge({
        codes_count: count,
        codes_percentage: count * 100.0 / total_codes_count
      })
    end
    statistics
  end

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create!(
        name: auth.extra.raw_info.name,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] unless user.email?
      end
    end
  end

  def liked_by_guilds
    codes_per_guild = self.created_codes.includes(:guild).group(:guild).sum(:likes_count)
    array = []
    codes_per_guild.each do |guild, count|
      array << guild.as_json.merge({
        liked_count: count
      })
    end
    array
  end
end
