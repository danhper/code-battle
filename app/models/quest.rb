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

  self.per_page = 5

  #return hash {key:Guild_id,value:Point}
  def guild_codes(guild)
    self.codes.where(quest_id: self).joins(:likes).group('user_like_codes.code_id').order('count(user_like_codes.code_id) desc')
  end

  def guild_best_code?(code)
    code == guild_codes(code.guild).first
  end

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
  #return hash {key:Guild_id,value:Guild top code_id in quest}
  def get_quest_guild_top
    h = Hash.new
    h.default = 0
    g_all = Guild.all##
    g_all.each do |g|
      codes = Code.where(:quest_id => self.id, :guild_id => g.id).joins(:likes)
      _h = Hash.new
      _h.default = 0
      codes.each{|c| _h[c.id]+=1 }
      hh = _h.max_by{ |_,v| v }
      h[g.id] = hh.nil? ? 0 : hh[0]
    end
    h
  end

  def get_top_codes
    h = self.get_quest_total_vote_point.sort_by{|_,v| -v }
    ary = Array.new
    h.each{|i| ary << Quest.find_by_id(i[0])}
    ary
  end

  def get_top_code
    self.get_top_codes.first
  end

end
