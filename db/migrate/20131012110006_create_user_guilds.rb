class CreateUserGuilds < ActiveRecord::Migration
  def change
    create_table :user_guilds do |t|
      t.integer :user_id
      t.integer :guild_id

      t.timestamps
    end

    add_index :user_guilds, :user_id
    add_index :user_guilds, :guild_id
  end
end
