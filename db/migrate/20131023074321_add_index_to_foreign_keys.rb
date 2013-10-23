class AddIndexToForeignKeys < ActiveRecord::Migration
  def change
    add_index :codes, :user_id
    add_index :codes, :guild_id
    add_index :codes, :quest_id
    add_index :comments, :user_id
    add_index :comments, :code_id
    add_index :quest_total_votes, :quest_id
    add_index :quests, :creator_id
    add_index :votes, :guild_id
  end
end
