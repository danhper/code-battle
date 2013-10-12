class AddIndexToJoinTables < ActiveRecord::Migration
  def change
    add_index :user_guilds, [:user_id, :guild_id]
    add_index :user_like_codes, [:user_id, :code_id]
  end
end
