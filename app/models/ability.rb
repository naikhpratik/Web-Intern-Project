class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
        can :manage, :all
    elsif user.is_product_manager?
        can :read, User
        can :read, Product
        can :manage, Product do |p|
            p.users.pluck(:id).include? (user.id)
        end
    elsif user.is_content_contributor?
        can [:read,:update], Product
    elsif user.is_instructor?
        can [:read], Product
    else
        can :read, Product
    end
  end
end
