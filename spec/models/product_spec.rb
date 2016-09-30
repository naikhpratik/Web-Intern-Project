require 'rails_helper'

<<<<<<< HEAD
RSpec.describe Product, type: :model do


  it { should have_many(:contents) }


  it "is valid with a name" do
=======
RSpec.describe Product, type: :model do  
  it "is valid with valid attributes" do
>>>>>>> 7e1290594763855c17c37ae0b43f05671e291172
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
