class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
        can :manage, :all
    elsif user.is_product_manager?
        can :read, User
        can [:read, :edit], Product
        #can [:manage], Contribution
        can [:read, :update, :edit], Product do |p|
            p.users.pluck(:id).include? (user.id)
        end
        can :manage, Contribution
    elsif user.is_content_contributor?
        can [:read], Product
        can [:read], Contribution
    elsif user.is_instructor?
        can [:read], Product
    else
        can :read, Product
    end
  end
end
