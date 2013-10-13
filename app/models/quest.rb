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
      h[i.voted_guild_id] += i.vote_num * Guild.find(i.voting_guild_id).get_guild_coefficient
    end
    h
  end


  # 用修正
  def get_quest_guild_top
    h = Hash.new
    h.default = 0
    g_all = Guild.all
    g_all.each do |g|
      codes = Code.where(:quest_id => 1, :guild_id => g.id).joins(:users)
      _h = Hash.new
      _h.default = 0
      codes.each{|c| _h[c.id]+=1 }
      hh = _h.max_by{ |_,v| v }
      h[g.id] = hh.nil? ? 0 : hh[0]
    end
    h
  end
end
