class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  belongs_to :guild
end
