class AddCreatorIdToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :creator_id, :integer
  end
end
