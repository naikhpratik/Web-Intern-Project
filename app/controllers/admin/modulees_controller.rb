class Admin::ModuleesController < Admin::BaseController
	before_action :set_modulee, only: [:edit, :update, :destroy]
	before_action :set_product, except: [:destroy]

  def edit
    @modulee = Modulee.find(params[:id])
  end

  def new
    @modulee = Modulee.new(product_id: @product.id) if @product.present?
    @modulee ||= Modulee.new
  end

  def create
  	@modulee = Modulee.new(modulee_params)

  	if @modulee.save
  	  redirect_to admin_product_path(@product), notice: 'Module was successfully created'
  	else
  		render action: :new
  	end
  end

  def update
  	@modulee = Modulee.find(params[:id])

  	if @modulee.update_attributes(modulee_params)
  		redirect_to	admin_product_path(@product), notice: 'Module was successfully updated.'
  	else
  		render action: :edit
  	end

  end

  private

  def set_modulee
  	@modulee = Modulee.find(params[:id])
  end

  def set_product
  	@product = Product.find(params[:product_id])
  end

  def modulee_params
  	params.require(:modulee).permit(:name, :product_id)
  end
end
