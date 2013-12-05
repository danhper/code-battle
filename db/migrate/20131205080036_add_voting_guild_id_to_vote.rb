class AddVotingGuildIdToVote < ActiveRecord::Migration
  def change
    add_column :votes, :voting_guild_id, :integer
  end
end
