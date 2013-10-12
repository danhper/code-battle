# == Schema Information
#
# Table name: problems
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Problem < ActiveRecord::Base
  has_many :votes
  has_many :guild, through: :votes
  has_many :code
end
