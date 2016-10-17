class Admin::ContentManagersController < Admin::BaseController
  before_action :set_product, only: [:index, :new, :create, :edit, :update, :set_content_contributors]
  before_action :set_content_contributors, only: [:new, :edit, :update]

  def index
    @contributors = product_contributors
  end

  def new
  end

  def create
    user = User.where(email: params[:contributor][:email]).first if params[:contributor][:email].present?

    if user.present?
      modules_ids = params[:contributor][:modules] || []
      records = []

      modules_ids.each_with_index do |id|
        records.push(ContentManager.find_or_create_by({ content_id: id, user_id: user.id, product_id: @product.id })) if id.to_i > 0
      end
    end

    respond_to do |format|
      if records.present?
        format.html { redirect_to admin_product_content_managers_path, notice: "Content Contributor was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_content_contributors
    @contributors = User.all.collect { |u| u.email if u.can_contribute_to_product?(@product.id)}
    @contributors ||= []
  end

  def product_contributors
    content_managers = ContentManager.where(product_id: @product.id)
    user_ids = content_managers.distinct.pluck(:user_id)
    contributors = []

    if user_ids.present?
      user_ids.each do |uid|
        contributors << OpenStruct.new({user: User.find(uid),
                  manage: content_managers.where(user_id: uid).pluck(:content_id).collect{ |cid| Content.find(cid).name }.join(', ')}) unless uid.blank?
      end
    end

    contributors
  end
end