class CreateTotalVote < ActiveRecord::Migration
  def change
    create_table :total_votes do |t|
      t.integer :voting_guild_id
      t.integer :voted_guild_id
      t.integer :vote_num
    end
  end
end
