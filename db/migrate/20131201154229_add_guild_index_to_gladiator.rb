class AddGuildIndexToGladiator < ActiveRecord::Migration
  def change
    add_index :gladiators, :guild_id
  end
end
