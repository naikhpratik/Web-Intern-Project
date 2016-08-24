require 'rails_helper'

RSpec.describe "UserProducts", type: :request do
  describe "GET /user_products" do
    it "works! (now write some real specs)" do
      get user_products_path
      expect(response).to have_http_status(200)
    end
  end
end
