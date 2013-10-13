# == Schema Information
#
# Table name: guilds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Guild < ActiveRecord::Base
  has_and_belongs_to_many :users, -> { uniq }, join_table: 'user_guilds'
  has_many :codes
  has_many :votes
  has_many :quests, through: :votes

  def to_param
    name
  end


  def get_guild_coefficient
    1.0 - (self.users.count / User.count)
  end

  def get_total_vote_point
    h = Hash.new
    h.default = 0
    tv_all = TotalVote.all
    tv_all.each do |i|
      h[i.voted_guild_id] += i.vote_num * get_guild_coefficient(i.voting_guild_id)
    end
  end

end
