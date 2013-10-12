class AddCodeIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :code_id, :integer
  end
end
