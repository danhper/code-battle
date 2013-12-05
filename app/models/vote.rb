# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  quest_id   :integer
#  guild_id   :integer
#  voting_guild_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest
  belongs_to :guild, foreign_key:"guild_id"
  belongs_to :guild, foreign_key:"voting_guild_id"
end
