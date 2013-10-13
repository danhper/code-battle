# == Schema Information
#
# Table name: guilds
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  url_safe_name :string(255)
#

class Guild < ActiveRecord::Base
  has_and_belongs_to_many :users, -> { uniq }, join_table: 'user_guilds'
  has_many :codes
  has_many :votes
  has_many :quests, through: :votes

  def to_param
    url_safe_name
  end
end
