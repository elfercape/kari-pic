# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
      #user ||= User.new # usuario invitado (no autenticado)
  
      if user.admin?
        can :manage, :all # Un administrador puede gestionar todo
      elsif user.normal?
        can :read, :all   # Un usuario normal solo puede leer todo
        can :create, Comentary # Los usuarios normales pueden crear posts
        can :update, Comentary, user_id: user.id # Pueden actualizar sus propios posts
      else
        can :read, Comentary, public: true # Los usuarios no autenticados solo pueden leer publicaciones públicas
      end
    
  end
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
