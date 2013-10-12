# == Schema Information
#
# Table name: codes
#
#  id         :integer          not null, primary key
#  source     :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Code < ActiveRecord::Base
  belongs_to :user
  belongs_to :problems
  has_many :user_like_codes
  has_many :users, through: :user_like_codes
end
