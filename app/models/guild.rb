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
<<<<<<< HEAD
  has_many :user_guild
  has_many :user, through: :user_guild
  has_many :votes
  has_many :problems, through: :votes
=======
  has_and_belongs_to_many :users, -> { uniq }, join_table: 'user_guilds'
  has_many :codes
  has_many :votes

  def to_param
    name
  end
>>>>>>> 811a420ab3df35cf386cf2f45eb51f8c61317d7e
end
