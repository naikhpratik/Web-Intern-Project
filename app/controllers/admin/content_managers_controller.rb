class Admin::ContentManagersController < Admin::BaseController
  before_action :set_product, only: [:index, :new, :create, :update, :set_content_contributors, :permissions]
  before_action :set_content_contributors, only: [:new, :update, :permissions]

  def index
    @contributors = product_contributors
  end

  def new
  end

  def create
    user = User.where(email: params[:contributor][:email]).first if params[:contributor][:email].present?
    user = random_user(params[:contributor][:email]) if user.blank?

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

  def permissions
    @contributor = params[:contributor]
  end

  def update
  end

  def destroy_permissions
    @contributor = params[:contributor]
    redirect_to admin_content_manager_path, notice: 'Content Manager was successfully removed.'
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
                  manage: content_managers.where(user_id: uid).pluck(:content_id).collect{ |cid| Content.find(cid) }}) unless uid.blank?
      end
    end

    contributors
  end

  def random_user(email)
    user = User.create({ username: email.split('@').first, email: email, password: email.split('@').first })
    role = Role.where(name: User::CONTENT_CONTRIBUTOR).first
    
    user.roles = [role]
    user_role = UserRole.create(user_id: user.id, role_id: role.id)
    user.save!

    user
  end
end
