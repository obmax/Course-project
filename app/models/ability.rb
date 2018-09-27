class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Manual
    can :read, Comment  
    can :read, Category
    if user.present?  
      can :manage, Manual, user_id: user.id 
      can :manage, Comment, user_id: user.id 
      can :read, Category
      if user.admin?  
        can :manage, :all
      end
    end
  end
end
