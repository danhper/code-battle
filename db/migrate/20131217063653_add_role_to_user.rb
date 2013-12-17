class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: 'normal'
    User.find_by(username: "tuvistavie").update(role: :admin)
  end
end
