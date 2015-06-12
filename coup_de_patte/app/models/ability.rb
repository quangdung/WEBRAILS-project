class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    if user.has_role?(:Admin)
      can :read, :all

      can :manage, Espece
      can :manage, TypeTache

      can :voir_roles, User
    end

    if user.has_role?(:Gerant)
      can :read, :all

      #Gerant can manage his own farms
      can :manage, Ferme do |ferme|
        ferme.user.id == user.id
      end

      #Gerant can manage his own animals
      can :manage, Animal do |animal|
        animal.user.id == user.id
      end


      can :update, Location do |location|
        location.animal.user.id == user.id
      end
    end

    if user.has_role?(:Paysan)
      can :read, :all

      #Paysan peut louer un animal (créer une location)
      can :create, Location
    end
  end
end
