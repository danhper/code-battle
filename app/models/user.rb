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
  devise :database_authenticatable, :rememberable, :trackable
  devise :omniauthable, omniauth_providers: [:github]

  has_and_belongs_to_many :guilds, -> { uniq }, join_table: 'user_guilds'
  has_and_belongs_to_many :liked_codes, -> { uniq }, join_table: 'user_like_codes', class_name: 'Code'
  has_many :votes
  has_many :quests, through: :votes

  has_many :created_quests, class_name: 'Quest', foreign_key: :creator_id
  has_many :created_codes, class_name: 'Code', foreign_key: :user_id

  has_many :comments

  validates :username, uniqueness: true

  def in_guild?(guild)
    guilds.exists?(guild)
  end

  def likes_code?(code)
    liked_codes.exists?(code) ? true : false
  end

  def votes_quest?(quest)
    quests.exists?(quest) ? true : false
  end

  def large_guild
    self.guilds.max{|x,y| x.users.count <=> y.users.count}
  end

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(
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
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
