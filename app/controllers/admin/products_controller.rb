class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_content_types, only: [:show, :new, :edit]

  # GET /products
  # GET /products.json
  def index
    if current_user.is_admin?
    @products = Product.all
  else
    @products = current_user.products
  end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.contents.new
  end

  # GET /products/1/edit
  def edit
    @contents = Content.all
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_url(@product), notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_content_types
      @content_types = ['Modulee', 'SubModule', 'Quiz', 'Flashcard', 'Html', 'Audio', 'Video']
    end


    # Never trust parameters from the scary internet, only allow the white list through.

    def product_params
      params.fetch(:product).permit(:title, :visibility, contents_attributes: [:id, :product_id, :description, :name, :parent_id, :actable_type, :url, :_destroy])
    end

end
