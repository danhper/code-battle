class AddCodeToGladiator < ActiveRecord::Migration
  def change
    add_column :gladiators, :code, :text
  end
end
