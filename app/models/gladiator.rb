# == Schema Information
#
# Table name: gladiators
#
#  id         :integer          not null, primary key
#  battle_id  :integer
#  user_id    :integer
#  guild_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :text
#

class Gladiator < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest
  belongs_to :guild

  delegate :username, to: :user, allow_nil: true
  delegate :name, to: :guild, prefix: true, allow_nil: true

end
