class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :token
      t.integer :quest_id
      t.integer :users_count, default: 0
      t.datetime :started_at

      t.timestamps
    end
    add_index :battles, :quest_id
    add_index :battles, :token

    create_table :gladiators do |t|
      t.references :battle, :user
      t.references :guild

      t.timestamps
    end
    add_index :gladiators, :user_id
    add_index :gladiators, [:battle_id, :user_id]
  end
end
