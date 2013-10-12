class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :code
  has_many :user_guild
  has_many :guild, through: :user_guild
  has_many :user_like_codes
  has_many :code, through: :user_like_codes
  has_many :votes
  has_many :problem, through: :votes
end
