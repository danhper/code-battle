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

  delegate :username, :email, to: :author, prefix: true
  delegate :name, :url_safe_name, to: :guild, prefix: true
  delegate :title, to: :quest, prefix: true

  validates_presence_of :guild
  validates_presence_of :quest

  self.per_page = 6

  def finalist?
    return false if self.likes_count == 0
    self.quest.guild_codes(self.guild).first == self
  end

  def formatted_source(options={})
    Pygments.highlight(self.source, options: { lexer: self.guild_url_safe_name }.merge(options)) || ''
  end

  def increment_likes_counter!
    self.increment!(:likes_count)
  end

  def decrement_likes_counter!
    self.decrement!(:likes_count)
  end

  def self.dummy
    dummy_guild =  Guild.new(url_safe_name: 'text')
    Code.new(source: "Error: signal 11:\n./NO_CODE[0x4006cc]\n/usr/lib/libc.so.6(+0x35450)[0x7f31d04ec450]\n./NO_CODE[0x400725]\n./NO_CODE[0x400748]\n./NO_CODE[0x400758]\n./NO_CODE[0x400782]\n/usr/lib/libc.so.6(__libc_start_main+0xf5)[0x7f31d04d8bc5]\n./NO_CODE[0x4005e9]\n", guild: dummy_guild)
  end
end
