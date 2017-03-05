class Admin::ModuleesController < Admin::BaseController
	before_action :set_modulee, only: [:show, :edit, :update, :destroy]
	before_action :set_product, except: [:destroy]

  def index
    @modulees = Content.where(product_id: 1, actable_type: 'Modulee')
  end

  def show
  end

  def new
    @modulee = Modulee.new(product_id: @product.id) if @product.present?
    @modulee ||= Modulee.new
  end
  
  def edit
  end

  def create
  	@modulee = Modulee.new(modulee_params)

  	if @modulee.save
  	  redirect_to admin_product_modulee_url(@product, @modulee), notice: 'Module was successfully created'
  	else
  		render action: :new
  	end
  end

  def update
  	if @modulee.update(modulee_params)
  		redirect_to	admin_product_modulee_url(@product, @modulee), notice: 'Module was successfully updated.'
  	else
  		render action: :edit
  	end
  end

  def destroy
  end

  private

  def set_modulee
  	@modulee ||= Modulee.find(params[:id])
  end

  def set_product
  	@product ||= Product.find(params[:product_id])
  end

  def modulee_params
  	params.require(:modulee).permit(:title, :product_id)
  end
end
