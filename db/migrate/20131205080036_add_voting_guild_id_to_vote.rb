class AddVotingGuildIdToVote < ActiveRecord::Migration
  def change
    add_column :votes, :voting_guild_id, :integer
    Vote.all.each do |v|
      v.update_attribute :voting_guild_id, v.user.large_guild
    end
  end
end
