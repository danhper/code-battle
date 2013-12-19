class Ability
  include CanCan::Ability

  def initialize(user)
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
    else
      can :create, [Quest, Code, Comment]
      can :update, Quest,   creator_id: user.id
      can [:update, :destroy], Comment, user_id: user.id
      can [:update, :destroy], Code,    user_id: user.id
      can :update, User, id: user.id
      can :vote, Code
      can :like, Code
      can :enter, Guild
    end
  end

  def can_vote?(user, code)
    if user.nil?
      raise CanCan::AccessDenied.new("Need to login to vote quest.", [:vote], Quest)
    end
    if current_user == code.author
      raise CanCan::AccessDenied.new("Cannot vote own code.", [:vote], Quest)
    end
    if current_user.votes_quest? code.quest
      raise CanCan::AccessDenied.new("Already voted this quest.", [:vote], Quest)
    end

    return true
  end

  def can_like?(user, like)
    unless current_user.in_guild? @code.guild
      render json: { error: 'can only like own guild' }, status: 400
    end
  end
end
