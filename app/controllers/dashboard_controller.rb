class DashboardController < ApplicationController

  def index
      if current_user
        @products = Product.where(visibility: [Product::VISIBILITY_ALL, Product::VISIBILITY_REGISTERED_USERS])
        @my_products = current_user.products || []
      else
        @products = Product.where(visibility: "All")
      end
  end
end
