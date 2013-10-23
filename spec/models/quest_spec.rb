require 'spec_helper'

describe Quest do

  before(:all) do
    @guild = Guild.first
    @creator = create(:user, guilds: [@guild])
    @quest = create(:quest, creator: @creator)
    @code = create(:code, author: @creator, guild: @guild, quest: @quest)
    10.times do
      user = create(:user)
      create(:code, author: user, quest: @quest, guild: user.guilds.first)
    end
  end

  subject { @quest }

  let(:creator_guild) { @guild }
  let(:creator_code) { @code }

  it { should respond_to(:codes) }
  it { should respond_to(:votes) }
  it { should respond_to(:codes) }
  it { should respond_to(:quest_total_votes) }
  it { should respond_to(:creator) }
  it { should respond_to(:finalists) }

  it 'should have right number of codes' do
    expect(subject.codes.count).to be 11
  end

  describe 'guild_codes' do
    let(:guild) { Guild.first }
    it 'should only return guilds codes' do
      codes = subject.guild_codes(guild)
      expect(codes.pluck(:guild_id).uniq).to eq [guild.id]
    end
  end

  describe 'finalists' do
    let(:quest) { @quest }
    subject { quest.finalists }
    let(:guild) { Guild.find(2) }


    it 'should not return codes not liked' do
      # first count returns group_by hash
      expect(subject.count.count).to be 0
    end


    context 'should return most liked codes for each guild' do
      let(:finalist) { create(:code, author: User.find(2), guild: guild, quest: quest) }
      let(:non_finalist) { create(:code, author: User.find(3), guild: guild, quest: quest) }

      before(:each) do
        finalist.update(likes_count: 4)
        non_finalist.update(likes_count: 3)
        creator_code.update(likes_count: 3)
      end

      after(:each) do
        Code.update_all(likes_count: 0)
      end

      it { expect(subject.count.count).to be 2}
      it { should include(finalist, creator_code) }
      it { should_not include(non_finalist) }
    end
  end
end
