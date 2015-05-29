class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
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

    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
