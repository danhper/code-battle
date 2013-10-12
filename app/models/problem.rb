class Problem < ActiveRecord::Base
  has_many :votes
  has_many :guild, through: :votes
  has_many :code
end
