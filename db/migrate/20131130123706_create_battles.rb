class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :token
      t.integer :quest_id
      t.integer :users_count
      t.datetime :started_at

      t.timestamps
    end
    add_index :battles, :quest_id
    add_index :battles, :token

    create_table :battles_users, id: false do |t|
      t.references :battle, :user
    end
    add_index :battles_users, :user_id
    add_index :battles_users, [:battle_id, :user_id]
  end
end
