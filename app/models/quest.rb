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
  has_many :battles
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'

  has_many :finalists,
           -> { select('distinct on (codes.guild_id) codes.*')
               .where('codes.likes_count > 0')
               .order('codes.guild_id')
               .by_likes
               .readonly },
           class_name: 'Code',
           foreign_key: 'quest_id'

  scope :by_date, -> { order(created_at: :desc) }

  delegate :username, to: :creator, prefix: true

  self.per_page = 5

  def guild_codes(guild)
    self.codes.by_likes.where(guild_id: guild)
  end

  def medalists
    scores = Hash.new
    scores.default = 0
    codes = QuestTotalVote.where(quest_id: self.id)
    codes.each do |i|
      scores[i.voted_guild_id] += i.vote_num * i.voting_guild.get_guild_coefficient
    end
    scores = scores.sort_by { |_,v| -v }
    medalists_ary = Array.new
    scores.each do |i|
      finalist = self.finalists.where(guild_id: i[0]).first
      medalists_ary << finalist unless finalist.nil?
    end

    if medalists_ary.length < 3
      medalists_ary.concat(self.finalists.sort{|i,j| j.likes_count <=> i.likes_count})
      medalists_ary.concat(self.codes) if medalists_ary.uniq.length < 3
    end

    medalists_ary.uniq{|c| c.guild_id }
  end

  def best_code
    self.medalists.first
  end

end
