class DashboardController < ApplicationController

  def index
      @products = Product.where(visibility: ["All", "Registered Users"])
      @my_products = current_user.products || [] if current_user
  end
end
