class Admin::HtmlsController < Admin::BaseController
	before_action :set_html, only: [:preview, :edit, :update, :destroy]
  before_action :set_product, except: [:destroy]
	before_action :set_content, except: [:destroy]

  def preview
  end

  def new
    @html = Html.new(product_id: @product.id) if @product.present?
    @html ||= Html.new
  end
  
  def edit
  end

  def create
  	@html = Html.new(html_params)

  	if @html.save
  	  redirect_to admin_product_html_url(@product, @html), notice: 'Html Content was successfully created'
  	else
  		render action: :new
  	end
  end

  def update
  	if @html.update(html_params)
  		redirect_to	preview_admin_product_html_url(@product, @html), notice: 'Html Content was successfully updated.'
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

  def set_content
    @content ||= Content.find(params[:content_id]) if params[:content_id].present?
  end

  def html_params
  	params.require(:html).permit(:title, :description, :html_source, :parent_id, :product_id)
  end

end
