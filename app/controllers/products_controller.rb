class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  layout 'product'

  def index
    @products = user_signed_in? ? current_user.products : []
  end

  def show

  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
end
