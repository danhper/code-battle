class CreateGuildMembersCounts < ActiveRecord::Migration
  def change
    create_table :guild_members_counts do |t|
      t.integer :guild_id
      t.datetime :datetime
      t.integer :members_count

      t.timestamps
    end
    add_index :guild_members_counts, :guild_id
  end
end
