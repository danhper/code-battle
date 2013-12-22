class Ability
  include CanCan::Ability

  def initialize(user, action)
    user ||= User.new

    alias_action :promote, :demote, to: :handle
    alias_action :unvote, to: :vote
    alias_action :unlike, to: :like
    alias_action :leave, to: :enter

    can :read, [User, Quest, Code, Comment, Guild]

    if user.role?(:admin)
      can :manage, :all
      can :handle, User
      cannot :handle, User, id: user.id
    elsif user.role?(:moderator)
      can :manage, Quest
      can :manage, Code
      can :manage, Comment
      can :read, :statistics
    else
      can :create, [Quest, Code, Comment]
      can :update, Quest,   creator_id: user.id
      can [:update, :destroy], Comment, user_id: user.id
      can [:update, :destroy], Code,    user_id: user.id
      can :update, User, id: user.id
    end

    unless user.id.nil?
      can :enter, Guild do |guild|
        can_enter? user, guild, action
      end
      can :vote, Code do |code|
        votable? code if action == :vote
        can_vote? user, code, action
      end
      can :like, Code do |code|
        can_like? user, code, action
      end
    end
  end

  def can_enter?(user, guild, action)
    forbid_same_state! guild.users.exists?(user), action == :enter, "Could not #{action} this guild"
    return true
  end

  def votable?(code)
    unless code.finalist?
      raise CanCan::AccessDenied.new("Cannot vote this code.", [:vote], Code)
    end
    return true
  end

  def forbid_own_code!(user, code)
    if user == code.author
      raise CanCan::AccessDenied.new("Cannot vote own code.", [:vote], Code)
    end
  end

  def require_same_guild!(user, code)
    unless user.in_guild? code.guild
      raise CanCan::AccessDenied.new("Cannot like code from other guild.", [:like], Code)
    end
  end

  def can_vote?(user, code, action)
    forbid_own_code! user, code
    forbid_same_state! user.votes_quest?(code.quest), action == :vote, "Could not #{action} this code"
    return true
  end

  def can_like?(user, code, action)
    require_same_guild! user, code
    forbid_own_code! user, code
    forbid_same_state! user.likes_code?(code), action == :like, "Could not #{action} this code"
    return true
  end

  def forbid_same_state!(current_state, new_state, message)
    if current_state == new_state
      raise CanCan::AccessDenied.new(message)
    end
  end
end
