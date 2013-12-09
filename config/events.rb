WebsocketRails::EventMap.describe do
  subscribe :initialize_connection, to: BattleController, with_method: :handle_initialization
  subscribe :ready_to_start, to: BattleController, with_method: :handle_ready
  subscribe :code_updated, to: BattleController, with_method: :handle_code_update
end
