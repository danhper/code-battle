class CreateQuestTotalVote < ActiveRecord::Migration
  def change
    create_table :quest_total_votes do |t|
      t.integer :quest_id
      t.integer :voting_guild_id
      t.integer :voted_guild_id
      t.integer :vote_num
    end
  end
end
