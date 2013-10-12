# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  comment_id :integer
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :code

  def as_json(options={})
    user_json = { user: { exclude: [:name, :email]} }
    super({ include: user_json }.merge(options))
  end
end
