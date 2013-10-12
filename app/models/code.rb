class Code < ActiveRecord::Base
  belongs_to :user
  belongs_to :problems
  has_many :user_like_codes
  has_many :user, through: :user_like_codes
end
