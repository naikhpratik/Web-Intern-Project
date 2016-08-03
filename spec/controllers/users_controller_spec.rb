require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /users" do
    it "works! (now lets do some real specs)" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "Should get index" do
    get :new
    assert_response :success
    end
 end

  describe "Post /create" do
    let(:user){create(:user)}
    it "should create user" do

      expect(User).to receive(:new).with(ActionController::Parameters.new( name: 'Naik', password: 'secret',password_confirmation: 'secret').permit(:name, :password, :password_confirmation)).and_return(user)
      expect(user).to receive(:save).and_return(true) # stub the `save` method
      post :create,  user: {name: 'Naik', password: 'secret', password_confirmation: 'secret'}
      expect(response).to redirect_to(users_path)
    end

    it "should show user" do

      visit users_url(user)
      assert_response :success
      expect(user.name). to eq 'Naik'
      #expect(flash[:notice]).to match(/^User was successfully created./)
  end


    it "should update user" do

      visit users_url
      expect(response).to have_http_status(200)
      post :update,  user: {name: user.name, password: 'admin1', password_confirmation: 'admin1'}, id: user.id
      expect(flash[:notice]).to match(/^User was successfully updated./)

    end
  end

end
