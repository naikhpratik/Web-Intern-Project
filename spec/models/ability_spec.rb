require "spec_helper"
require "cancan/matchers"

describe "Ability" do
  describe "as admin" do
    it "can manage all" do
      user = FactoryGirl.create(:user)
      role = Role.create(name: 'Admin')
      user.roles = [role]
      user_role = UserRole.create(user_id: user.id, role_id: role.id)
      user.save!

      ability = Ability.new(user)
      expect(ability).to be_able_to(:manage, :all)
    end
  end

  describe "as product manager" do
    it "can manage Product and User" do
      user = FactoryGirl.create(:user)
      role = Role.create(name: 'Product Manager')
      user.roles = [role]
      user_role = UserRole.create(user_id: user.id, role_id: role.id)
      user.save!

      ability = Ability.new(user)
      expect(ability).to be_able_to(:manage, Product)
      expect(ability).to be_able_to(:manage, User)
    end
  end

  describe "as content contributor" do
    it "can read and update Product" do
      user = FactoryGirl.create(:user)
      role = Role.create(name: 'Content Contributor')
      user.roles = [role]
      user_role = UserRole.create(user_id: user.id, role_id: role.id)
      user.save!

      ability = Ability.new(user)
      expect(ability).to be_able_to(:read, Product)
      expect(ability).to be_able_to(:update, Product)
    end
  end

  describe "as normal user" do
    it "can read all" do
      user = FactoryGirl.create(:user)

      ability = Ability.new(user)
      expect(ability).to be_able_to(:read, Product)
    end
  end
end
