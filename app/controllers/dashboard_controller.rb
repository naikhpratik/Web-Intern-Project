class DashboardController < ApplicationController

  def index
      if current_user
        @products = Product.where(visibility: ["All", "Registered Users"])
        @my_products = current_user.products || []
      else
        @products = Product.where(visibility: "All")
      end
  end
end
