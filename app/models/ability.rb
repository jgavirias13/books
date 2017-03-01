class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, :all
    end

    can :update, Libro do |libro|
      libro.user == user
    end

    can :destroy, Libro do |libro|
      libro.user == user
    end
  end
end
