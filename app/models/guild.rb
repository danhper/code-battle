class Guild < ActiveRecord::Base
  has_many :user_guild
  has_many :user, through: :user_guild
  has_many :votes
  has_many :problems, through: :votes
end
