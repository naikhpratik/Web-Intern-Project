require 'rails_helper'

RSpec.describe Product, type: :model do


  it { should have_many(:contents) }


  it "is valid with a name" do
    product = FactoryGirl.create(:product)
    expect(product).to be_valid
  end

  it "is not valid without a name" do
  	product = Product.new
  	expect(product).to be_invalid
  end

end
