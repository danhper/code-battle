class RenameProblemToQuest < ActiveRecord::Migration
  def change
    rename_table :problems, :quests
    rename_column :codes, :problem_id, :quest_id
    remove_index :votes, column: [:user_id, :problem_id]
    rename_column :votes, :problem_id, :quest_id
    add_index :votes, [:user_id, :quest_id]
  end
end
