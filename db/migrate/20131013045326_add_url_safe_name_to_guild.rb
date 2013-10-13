class AddUrlSafeNameToGuild < ActiveRecord::Migration
  def change
    add_column :guilds, :url_safe_name, :string
  end
end
