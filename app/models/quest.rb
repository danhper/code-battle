# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: quests
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  creator_id  :integer
#

class Quest < ActiveRecord::Base
  has_many :votes
  has_many :guilds, through: :votes
  has_many :codes
  has_many :quest_total_votes
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'

  def GetGuildCoefficient gid
    return 1.0 - (Guild.count(:users, :conditions => ["guild_id = gid"]) / Guild.count(:users))
  end

  def GetQuestTotalVotePoint qid
    h = Hash.new
    h.default = 0
    QuestTotalVote.where(:quest_id => qid).find_each do |i|
      h[i.voting_id] += i.vote_num * GetGuildCoefficient(i.voted_id)
    end

    return h
  end

  def GetTotalVotePoint
    h = Hash.new
    h.default = 0
    TotalVote.find_each do |i|
      h[i.voting_id] += i.vote_num * GetGuildCoefficient(i.voted_id)
    end
  end

  def GetQuestGuildTop qid
    h = Hash.new
    h.default = 0
    Guild.find_each do |g|
      h[g.ids] =
        Code.where(:quest_id => qid, :guild_id => g.ids).order("users DESC").first
    end
  end
end
