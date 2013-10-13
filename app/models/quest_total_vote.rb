# == Schema Information
#
# Table name: quest_total_votes
#
#  id              :integer          not null, primary key
#  quest_id        :integer
#  voting_guild_id :integer
#  voted_guild_id  :integer
#  vote_num        :integer
#

class QuestTotalVote < ActiveRecord::Base
  belongs_to :quest
  belongs_to :guild, foreign_key:"voting_guild_id"
  belongs_to :guild, foreign_key:"voted_guild_id"

  def inc_num
    self.vote_num+=1
    self.save
  end

  def dec_num
    self.vote_num-=1
    self.save
  end
end
