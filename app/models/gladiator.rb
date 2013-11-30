class Gladiator < ActiveRecord::Base
  belongs_to :user
  belongs_to :quest
  belongs_to :guild

  delegate :username, to: :user, allow_nil: true
  delegate :name, to: :guild, prefix: true, allow_nil: true

end
