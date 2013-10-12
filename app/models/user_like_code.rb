# == Schema Information
#
# Table name: user_like_codes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  code_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserLikeCode < ActiveRecord::Base
end
