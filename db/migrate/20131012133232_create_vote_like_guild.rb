class CreateVoteLikeGuild < ActiveRecord::Migration
  def change
    create_table :vote_like_guilds do |t|
      t.integer :vote_id
      t.integer :guild_id
    end

    add_index :vote_like_guilds, [:vote_id,:guild_id]
  end
end
