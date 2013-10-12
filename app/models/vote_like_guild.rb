class VoteLikeCode < ActiveRecord::Base
  belongs_to :vote
  belongs_to :guild
end
