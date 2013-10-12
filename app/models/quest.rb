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


  def get_quest_total_vote_point
    h = Hash.new
    h.default = 0
    q_all = QuestTotalVote.where(:quest_id => self.id)
    q_all.each do |i|
      h[i.voted_id] += i.vote_num * get_quild_coefficient(i.voting_id)
    end
    
    h
  end


  def get_quest_guild_top
    h = Hash.new
    h.default = 0
    g_all = Guild.all
    g_all.each do |g|
      h[g.id] =
        Code.where(:quest_id => self.id, :guild_id => g.id).order("users DESC").first
    end
    h
  end
end
