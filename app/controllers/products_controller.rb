class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    #@products = Product.all
    if params[:user_id]
      @user = User.find(params[:user_id])
      @products = @user.products.all
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show

  end

  # GET /products/new
  def new
    @product = Product.new

    @all_user = User.all

    @userproduct = @product.user_products.build

  end

  # GET /products/1/edit
  def edit
    @all_user = User.all
    @userproduct = @product.user_products.build
  end
  # GET /products/1/edit
  #def manage_product
    #@product = Product.find(params[:id])
  #end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    #render text: params.inspect
    @relationship = params[:relationship]
  #  @product = Product.update(product_params)
  params[:users][:id].each do |user|
    if !user.empty?
      @product.user_products.build(:user_id => user,:relationship => @relationship)
    end
  end



  respond_to do |format|
    if @product.update(product_params)
      format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      format.json { render :show, status: :ok, location: @product }
    else
      format.html { render :edit }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    #Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name,:id,
      user_product: [:relationship])
    end
end
