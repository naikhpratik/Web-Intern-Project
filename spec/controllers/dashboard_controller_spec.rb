require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.build(:product).attributes
  }

  describe "GET #dashboard" do
    it "assigns all products as @products" do
      product = Product.create! valid_attributes
      get :dashboard, params: {}
      expect(assigns(:products)).to eq([product])
    end
  end
  

end
