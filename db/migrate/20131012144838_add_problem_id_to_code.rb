class AddProblemIdToCode < ActiveRecord::Migration
  def change
    add_column :codes, :problem_id, :integer
  end
end
