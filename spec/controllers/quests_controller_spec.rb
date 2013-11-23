require "spec_helper"

describe QuestsController do
  let!(:quests) { FactoryGirl.create_list(:quest_with_codes, 6) }

  describe "GET #index" do
    it "should respond successfully" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "should return first 5 quests" do
      get :index
      assigned_quests = assigns(:quests)
      expect(assigned_quests.to_a.count).to eq(5)
    end

    it "should not contain codes without likes" do
      get :index
      assigned_quests = assigns(:quests)
      assigned_quests.each do |q|
        expect(q.codes.count).to eq(10)
        expect(q.finalists.to_a.count).to eq(0)
      end
    end

    it "should contain finalists" do
      last_quest = quests.last
      last_quest.codes.first.update(likes_count: 5)
      get :index
      q = assigns(:quests).first
      expect(last_quest.id).to eq(q.id)
      expect(q.finalists.to_a.count).to eq(1)
    end
  end
end
