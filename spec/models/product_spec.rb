require 'rails_helper'

RSpec.describe Product, type: :model do  
  it { should have_many(:contents) }

  it { should have_many(:user_products) }
  
  it "is valid with valid attributes" do
    product = FactoryGirl.create(:product)
    expect(product).to be_valid
  end

  it "is not valid without a name" do
    product = Product.new(visibility: "All")
    expect(product).to be_invalid
  end

  it "is not valid without visibility" do
    product = Product.new(name: "Test Product 1")
  	expect(product).to be_invalid
  end
end
