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
  has_many :users
  has_many :codes
  has_many :votes
end
