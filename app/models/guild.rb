# == Schema Information
#
# Table name: guilds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Guild < ActiveRecord::Base
  has_and_belongs_to_many :users, -> { uniq }, join_table: 'user_guilds'
  has_many :codes
  has_many :votes
  has_many :problems, through: :votes
  has_many :vote_like_guilds
  has_many :votes, through: :guilds

  def to_param
    name
  end
end
