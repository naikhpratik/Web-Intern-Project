class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Admin abilities
    if user.is_admin?
      can :manage, :all
    
    # Product Manager abilities
    elsif user.is_product_manager?
      can :read, User
      can [:read, :update], Product do |p|
        p.users.pluck(:id).include? (user.id)
      end
      common_abilities(user, [:manage])
    # -------------------------------------------

    # Content Contributor abilities
    elsif user.is_content_contributor?
      common_abilities(user, [:read, :update])
    # -------------------------------------------

    # Content Manager abilities
    elsif user.is_content_manager?
      common_abilities(user, [:read, :update])
    # -------------------------------------------

    # Instructor Abilities
    elsif user.is_instructor?
      can [:read], Product
    else
      can :read, Product
    end
  end

  def common_abilities(user, auth)
    can [:read], Product
    can auth, Content do |c|
      content_ids = user.permissions.collect { |p| p.contents }.flatten
      content_ids.include? ("#{c.id}")
    end
    can auth, Modulee do |m|
      is_managing_contents(user, m)
    end
    can auth, Flashcard do |f|
      is_managing_contents(user, f)
    end
    can auth, Quiz do |q|
      is_managing_contents(user, q)
    end
    can auth, Media do |m|
      is_managing_contents(user, m)
    end
    can auth, Html do |h|
      is_managing_contents(user, h)
    end
  end

  def is_managing_contents(user, c_type)
    content_ids = user.permissions.collect { |p| p.contents }.flatten
    content_ids.include? ("#{c_type.acting_as.id}")
  end
end
