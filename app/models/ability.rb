class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new 
    if user.has_role? :SuperAdmin
        can :manage, :all  
    else  
      can :update, :all  
    end  
  end
end