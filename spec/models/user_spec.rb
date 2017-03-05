require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  it "is not valid with all the blank attributes" do
  	user = User.new
  	expect(user).to be_invalid
  end
end
