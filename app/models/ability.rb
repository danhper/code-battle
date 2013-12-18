class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, [User, Quest, Code, Comment, Guild]

    if user.role?(:admin)
      can :manage, :all
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
    end
  end
end
