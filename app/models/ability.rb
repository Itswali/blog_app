class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :create, [Comment, Post, Like]
    can :destroy, [Comment, Post, Like]

    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Comment, author: user
      can :destroy, Post, author: user
      can :destroy, Like, author: user
    end

    # can :read, Post, public: true

    # return unless user.present?  # additional permissions for logged in users (they can read their own posts)
    # can :read, Post, user: user

    # return unless user.admin?  # additional permissions for administrators
    # can :read, Post

    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
