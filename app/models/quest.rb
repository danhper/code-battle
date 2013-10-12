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

  def GetQuestTotalVote _quest_id
    h = Hash.new
    h.default = 0

    QuestTotalVote.where(:quest_id => _quest_id).find_each do |i|
      h[i.voting_id]
    end
    
    # Guild.select("guild_id").find_each do |voting_gid|
    #   Guild.select("guild_id").find_each do |voted_gid|
        
    #   end  
    # end
    

  end
end
