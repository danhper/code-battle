# == Schema Information
#
# Table name: codes
#
#  id          :integer          not null, primary key
#  source      :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  guild_id    :integer
#  quest_id    :integer
#  likes_count :integer          default(0), not null
#

class Code < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :quest
  belongs_to :guild

  has_and_belongs_to_many :likes,
                          -> { uniq },
                          join_table: 'user_like_codes',
                          class_name: 'User',
                          after_add: -> (c, u) { c.increment_likes_counter! },
                          after_remove: -> (c, u) { c.decrement_likes_counter! }
  has_many :comments

  scope :by_likes, -> { order(likes_count: :desc) }
  scope :liked, -> { where 'likes_count > 0' }

  validates_presence_of :guild
  validates_presence_of :quest

  self.per_page = 6

  def finalist?
    return false if self.likes_count == 0
    self.quest.guild_codes(self.guild).first == self
  end

  def formatted_source(options={})
    Pygments.highlight(self.source, options: { lexer: self.guild.url_safe_name }.merge(options)) || ''
  end

  def increment_likes_counter!
    self.increment!(:likes_count)
  end

  def decrement_likes_counter!
    self.decrement!(:likes_count)
  end
end
