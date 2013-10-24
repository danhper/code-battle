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

  has_many :finalists,
           -> { select('codes.*, max(codes.likes_count)')
               .group('codes.guild_id', 'codes.quest_id')
               .where('codes.likes_count > 0')
               .by_likes
               .readonly },
           class_name: 'Code',
           foreign_key: 'quest_id'

  scope :with_finalists,
        -> { includes(finalists: [:guild, :quest, :author])
            .group('codes.guild_id', 'quests.id')
            .order('codes.likes_count DESC') }

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
    scores.sort_by { |_,v| -v }
  end

  def best_code
    self.finalists.first
  end

end
