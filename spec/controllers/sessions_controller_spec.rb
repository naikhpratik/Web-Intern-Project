require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
let(:admin){create(:user)}
  describe "GET /users" do
    #let(:user){create(:user)}

    it "should get login " do
      visit login_url
      expect(response).to have_http_status(200)
      #expect(response).to redirect_to(login_url)
    end

    it "should create/login " do

      visit login_url
      post :create,  admin: {name: 'admin', password: 'admin'}
        #expect(response).to have_http_status(200)
      expect(response).to redirect_to(login_url)
    end


  end
end
