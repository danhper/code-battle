class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :problem_id
      t.integer :guild_id

      t.timestamps
    end

    add_index :votes, [:user_id, :problem_id]
  end
end
