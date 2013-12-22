class StatisticsController < ApplicationController
  skip_load_and_authorize_resource

  def index
    authorize! :read, :statistics
    @statistics = {
      user_count: User.count,
      quest_count: Quest.count,
      code_count: Code.count,
      comment_count: Comment.count,
    }
  end
end
