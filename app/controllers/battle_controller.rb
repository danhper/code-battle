class BattleController < WebsocketRails::BaseController
  def initialize_session
    controller_store[:battles] = []
  end

  def handle_connection
    quest_id = message[:questId]
    battles = controller_store[:battles]
    return trigger_failure({ message: 'no such quest' }) unless Quest.exists?(quest_id)
    battles[quest_id] = [] if battles[quest_id].nil?
    battles[quest_id].each do |battle|
      if battle[:users].count < 2
        battle[:users] << current_user.as_json
        WebsocketRails[battle[:token]].trigger(:new_user, battle)
        return trigger_success(battle)
      end
    end
    battle_token = SecureRandom.urlsafe_base64(20, false)
    new_battle = {
      token: battle_token,
      users: [current_user.as_json]
    }
    battles[quest_id] << new_battle
    trigger_success new_battle
  end

  def update_code

  end
end
