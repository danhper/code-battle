# == Schema Information
#
# Table name: total_votes
#
#  id              :integer          not null, primary key
#  voting_guild_id :integer
#  voted_guild_id  :integer
#  vote_num        :integer
#

class TotalVote < ActiveRecord::Base
  belongs_to :guild, foreign_key:"voting_guild_id"
  belongs_to :guild, foreign_key:"voted_guild_id"
end
