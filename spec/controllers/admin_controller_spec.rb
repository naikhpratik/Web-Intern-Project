require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET /users" do
    it "Admin Index" do
      visit admin_path
      expect(response).to have_http_status(200)
    end
  end
end
