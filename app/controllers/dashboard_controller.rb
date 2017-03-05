class DashboardController < ApplicationController

  def index
      if current_user
        @products = Product.where(visibility: [Product::VISIBILITY_ALL, Product::VISIBILITY_REGISTERED_USERS])
        @my_products = current_user.subscribed_products || []
      else
        @products = Product.where(visibility: Product::VISIBILITY_ALL)
      end
  end
end
