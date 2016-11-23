class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_content_types, only: [:show, :new, :edit]

  # GET /products
  # GET /products.json
  def index
    if current_user.is_admin?
      @products = Product.all
    elsif current_user.is_content_contributor?
      @products = current_user.contributions.collect { |c| c.content.product if c.content.present? }.compact.uniq
    else
      @products = current_user.products
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @contents = Content.where(:product_id => params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.contents.new
  end

  # GET /products/1/edit
  def edit
    @contents = Content.all
    @product_managers = @product.users.pluck(:email) unless @product.users.empty?
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
    pparams = product_params
    user_emails = pparams[:managers]

    # Update PMs for a Project only when the current user is an admin
    if current_user.is_admin?
      if user_emails.present?
        user_products = []
        role = Role.find_by_name(User::PRODUCT_MANAGER)

        user_emails.each do |email|
          user = User.find_by_email(email)
          user_products << UserProduct.find_or_create_by({ user_id: user.id, product_id: @product.id, role_id: role.id }) unless user.blank?
        end

        @product.user_products = user_products unless user_products.empty?
      else
        @product.user_products = []
      end
    end

    # Remove :managers symbol as it's not part of the Product instance
    pparams.delete(:managers)

    respond_to do |format|
      if @product.update(pparams)
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
      @content_types = Content::CONTENT_TYPES
    end


    # Never trust parameters from the scary internet, only allow the white list through.

    def product_params
      params.fetch(:product).permit(:title, :visibility,
        managers: [],
        contents_attributes: [:id, :product_id, :description, :name, :parent_id, :actable_type, :url, :_destroy])
    end

end
