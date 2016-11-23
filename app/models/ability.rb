class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
        can :manage, :all
    elsif user.is_product_manager?
        can :read, User
        #can [:manage], Contribution
        can [:read, :update, :edit], Product do |p|
            p.users.pluck(:id).include? (user.id)
        end
        can :manage, Content do |c|
            p.contents.pluck(:id).include? (c.id)
        end
    elsif user.is_content_contributor?
        can [:read, :update, :edit], Product do |p|
            user.contributions.pluck(:product_id).include? (p.id)
        end
        can [:read], Content do |c|
            user.contributions.pluck(:content_id).include? (c.id)
        end
    elsif user.is_instructor?
        can [:read], Product
    else
        can :read, Product
    end
  end
end
