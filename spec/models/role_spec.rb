require 'rails_helper'

RSpec.describe Role, type: :model do
  it "is valid with a valid name" do
    role = FactoryGirl.create(:role)
    expect(role).to be_valid
  end

  it "is not valid with a blank name" do
    role = Role.new
    expect(role).to be_invalid
  end

  it "is not valid with a duplicated name" do
    role = Role.create(name: 'Test Role 1')
    new_role = Role.create(name: 'Test Role 1')

    expect(new_role).to be_invalid
  end
end
