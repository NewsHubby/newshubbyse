class Ability
  include CanCan::Ability

  def initialize(press_room)
    
    press_room ||= PressRoom.new # guest user (not logged in)

    if press_room.admin?
      can :manage, :all
    else
      can :read, :all

      can :manage, PressRoom, id: press_room.id

      can :manage, PressRelease, press_room_id: press_room.id
      
      #can :manage, Distribution do |distribution|
       # distribution.press_release.joins(:press_release).where("press_release.press_room_id = ?", press_room.id).any?
      #end
      
      can :read, Question
      
      #can :manage, Link, press_room_id: press_room.id

      #can :manage, Upload, press_room_id: press_room.id

      #can :manage, PressreleaseType, press_room_id: press_room.id
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
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