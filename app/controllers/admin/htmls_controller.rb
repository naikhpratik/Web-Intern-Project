class Admin::HtmlsController < ApplicationController
	before_action :set_html, only: [:edit, :update, :destroy]
	before_action :set_product, except: [:destroy]

  def new
    @html = Html.new(product_id: @product.id) if @product.present?
    @html ||= Html.new
  end
  
  def edit
  end

  def create
  	@html = Html.new(html_params)

  	if @html.save
  	  redirect_to admin_product_url(@product), notice: 'Html Content was successfully created'
  	else
  		render action: :new
  	end
  end

  def update
  	if @html.update(html_params)
  		redirect_to	admin_product_url(@product), notice: 'Html Content was successfully updated.'
  	else
  		render action: :edit
  	end
  end

  def destroy
  end

  private

  def set_html
  	@html ||= Html.find(params[:id])
  end

  def set_product
  	@product ||= Product.find(params[:product_id])
  end

  def html_params
  	params.require(:html).permit(:name, :description, :product_id)
  end

end
