class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = current_user.products || []
  end

  def show
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
