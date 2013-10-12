class AddGuildIdToCode < ActiveRecord::Migration
  def change
    add_column :codes, :guild_id, :integer
  end
end
