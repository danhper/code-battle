class ChangeQuestDescriptionToText < ActiveRecord::Migration
  def up
    change_column :quests, :description, :text
  end

  def down
    change_column :quests, :description, :string
  end
end
