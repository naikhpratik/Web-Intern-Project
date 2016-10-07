class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
        can :manage, :all
    elsif user.is_product_manager?
        can :manage, Product
        can :manage, User
    elsif user.is_content_contributor?
        can [:read,:update], Product
    else
        can :read, Product
    end
  end
end
