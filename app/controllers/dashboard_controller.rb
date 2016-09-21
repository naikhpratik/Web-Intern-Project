class DashboardController < ApplicationController

  def index
      @products = Product.all
      @user = User.all
      @userproducts = UserProduct.all
  end
end
