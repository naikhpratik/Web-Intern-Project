require 'rails_helper'
require 'capybara/rspec'
require "cancan/matchers"

describe "Ability" do
  describe "as admin" do
    it "can manage all" do
      user = user_with_role 'Admin'

      ability = Ability.new(user)
      expect(ability).to be_able_to(:manage, :all)
    end
  end

  describe "as product manager" do
    it "can read Product and User" do
      user = user_with_role 'Product Manager'

      ability = Ability.new(user)
      expect(ability).to be_able_to(:read, Product)
      expect(ability).to be_able_to(:read, User)
    end
  end

  describe "as product manager" do
    it "can assign users to the product which they were assigned" do
      user = user_with_role 'Product Manager'
      product = FactoryGirl.create(:product)

      role_ids = user.roles.pluck(:title)
      product_ids = [product.id]

      user_products = []

      role_ids.each_with_index do |role_id, index|
        user_products.push(UserProduct.create(user_id: user.id, product_id: product_ids[index], role_id: Role.find_by_name(role_id).id)) unless role_id.blank?
      end

      user.user_products = user_products
      user.save!

      ability = Ability.new(user)
      expect(ability).to be_able_to(:read, product)
      expect(ability).to be_able_to(:update, product)
    end
  end

  describe "as content contributor" do
    it "can read and update Product" do
      user = user_with_role 'Content Contributor'

      content = FactoryGirl.create(:content)
      contribution = Contribution.create(user_id: user.id, product_id: content.product.id, content_id: content.id)

      ability = Ability.new(user)
      expect(ability).to be_able_to(:read, Product)
      expect(ability).to be_able_to(:read, content)
    end
  end

  describe "as content instructor" do
    it "can read Product" do
      user = user_with_role 'Instructor'

      ability = Ability.new(user)
      expect(ability).to be_able_to(:read, Product)
    end
  end

  describe "as normal user" do
    it "can read Product" do
      user = FactoryGirl.create(:user)

      ability = Ability.new(user)
      expect(ability).to be_able_to(:read, Product)
    end
  end

  private

  def user_with_role (role_name = nil)
    user = FactoryGirl.create(:user)
    role = Role.create(name: role_name)
    user.roles = [role]
    user_role = UserRole.create(user_id: user.id, role_id: role.id)
    user.save!

    user
  end
end
