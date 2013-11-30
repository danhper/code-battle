class BattleController < WebsocketRails::BaseController
  before_action :set_quest, only: [:handle_connection]
  before_action :set_battle, only: [:handle_ready]

  def initialize_session
  end

  def handle_ready
    return if @battle.nil?
    if @battle.users.count == 2 && @battle.started_at.nil?
      @battle.update(started_at: Time.now)
      WebsocketRails[@battle.token].trigger(:ready_to_start)
    else
      WebsocketRails[@battle.token].trigger(:need_update)
    end
  end

  def handle_connection
    return if @quest.nil?
    battle = @quest.battles.joins(:users).where(battles_users: { user_id: current_user.id }).first
    unless battle.nil?
      return trigger_success(battle)
    end

    battle = @quest.battles.where("users_count < ?", 2).first
    unless battle.nil?
      battle.users << current_user
      WebsocketRails[battle.token].trigger(:new_user, battle)
      return trigger_success(battle)
    end

    battle = @quest.battles.create!(token: SecureRandom.urlsafe_base64(20, false))
    battle.users << current_user
    trigger_success battle
  end

  private
  def set_quest
    @quest = Quest.find(message[:questId]) rescue nil
    trigger_failure({ message: 'no such quest' }) if @quest.nil?
  end

  def set_battle
    @battle = Battle.find_by(token: message[:token]) rescue nil
    trigger_failure({ message: 'no such battle' }) if @battle.nil?
  end
end
