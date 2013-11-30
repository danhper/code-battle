class BattleController < WebsocketRails::BaseController
  def initialize_session
  end

  def handle_connection
    quest = Quest.find(message[:questId]) rescue nil
    return trigger_failure({ message: 'no such quest' }) if quest.nil?

    battle = quest.battles.joins(:users).where(battles_users: { user_id: current_user.id }).first
    return trigger_success(battle) unless battle.nil?

    battle = quest.battles.where("users_count < ?", 2).first
    unless battle.nil?
      battle.users << current_user
      WebsocketRails[battle.token].trigger(:new_user, battle)
      return trigger_success(battle)
    end

    battle = quest.battles.create!(token: SecureRandom.urlsafe_base64(20, false))
    battle.users << current_user
    trigger_success battle
  end
end
