class Battle < ActiveRecord::Base
  has_many :gladiators,
    after_add:    -> (b, _) { b.increment!(:users_count) },
    after_remove: -> (b, _) { b.decrement!(:users_count) }

  has_many :users, through: :gladiators

  belongs_to :quest

  def as_json(options={})
    super({ include: { users: { only: [:id, :username] } } }.merge(options))
  end

end
