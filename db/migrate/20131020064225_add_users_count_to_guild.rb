class AddUsersCountToGuild < ActiveRecord::Migration
  def change
    add_column :guilds, :users_count, :integer, default: 0, null: false
    Guild.all.each do |guild|
      guild.users_count = guild.users.count
      guild.save!
    end
  end
end
