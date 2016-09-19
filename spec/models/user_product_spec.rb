require 'rails_helper'

RSpec.describe UserProduct, type: :model do

  it {
    up = UserProduct.new

    expect(up).to belong_to(:user)
    expect(up).to belong_to(:product)
  }

end
