class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_content_types, only: [:show, :new, :edit]

  def index
    if current_user.is_admin?
      @products = Product.all
    elsif current_user.is_content_contributor?
      @products = current_user.contributions.collect { |c| c.content.product if c.content.present? }.compact.uniq
    else
      @products = current_user.products
    end
  end

  def import
     rowarray = Hash.new
     values=Array.new
     spreadsheet = Product.open_spreadsheet(params[:file])
     header = spreadsheet.row(1)
     (2..spreadsheet.last_row).each do |i|
       rowarray = Hash[[header, spreadsheet.row(i)].transpose]
        #@rowarray = rowarray
        values << rowarray

     end
     session[:rowarray] = rowarray
     session[:array] = values
       redirect_to :back, notice: "Records imported."
  end

  def show
    @contents = Content.rank(:row_order).where(:product_id => params[:id]).roots
    @rowarray = session[:rowarray]
    @values = session[:array]
  end

  def new
    @product = Product.new
  end

  def edit
    @contents = Content.all
    @product_managers = @product.users.pluck(:email) unless @product.users.empty?
  end

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

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_url(@product), notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

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
      @content_types = Content::CONTENT_TYPES
    end


    # Never trust parameters from the scary internet, only allow the white list through.

    def product_params
      params.fetch(:product).permit(:title, :visibility,
        managers: [],
        permissions_attributes: [:id, :product_id, :user_id, :role_id, :_destroy, contents: []])
    end

end
