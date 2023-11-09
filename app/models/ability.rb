class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user.admin?
      can :manage, :all
    else
      can :create, [Post, Comment]
      can :manage, Post, author_id: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
