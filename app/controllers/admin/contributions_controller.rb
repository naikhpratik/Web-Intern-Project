class Admin::ContributionsController < Admin::BaseController
  before_action :set_product, only: [:index, :new, :create, :update, :set_content_contributors, :permissions, :update_permissions, :destroy_permissions]
  before_action :set_content_contributors, only: [:new, :update, :permissions]

  def index
    @contributors = product_contributors
  end

  def new
  end

  def email_fields
  end

  def create

      if params[:contributor][:email].present?
        user = User.where(email: params[:contributor][:email]).first
        flag = true
      end
        if user.blank?
        flag = false
        user = random_user(params[:contributor][:email])
      end

      if user.present?
        modules_ids = params[:contributor][:modules] || []
        records = []

        modules_ids.each_with_index do |id|
          records.push(Contribution.find_or_create_by({ content_id: id, user_id: user.id, product_id: @product.id })) if id.to_i > 0
        end
      end

      respond_to do |format|
        if records.present?

          UserMailer.sample_email(user,flag,@product.title).deliver
          format.html { redirect_to admin_product_contributions_path, notice: "Content Contributor was successfully created." }
        else
          UserMailer.sample_email(user,flag,@product.title).deliver
          format.html { render :email_fields }
        end
      end
    end

  def permissions
    @user ||= User.new
    @contributions = @user.contributions(@product.id).pluck(:content_id) if @user.present?
  end

  def update_permissions
    if params[:contributor][:email].present?
      user = User.where(email: params[:contributor][:email]).first
      existing_ids = user.contributions.pluck(:content_id) if user.present?

      # Add new or update records
      new_modules_ids = (params[:contributor][:modules] - existing_ids) || []
      new_modules_ids.each do |id|
        Contribution.find_or_create_by({ content_id: id, user_id: user.id, product_id: @product.id }) if id.to_i > 0
      end

      # Destroy records
      destroy_ids = Contribution.where(user_id: user.id, product_id: @product.id).where.not(content_id: params[:contributor][:modules]).pluck(:content_id)
      destroy_ids.each do |id|
        contribution = Contribution.where(content_id: id, user_id: user.id, product_id: @product.id).first if id.to_i > 0
        contribution.destroy if contribution.present?
      end
    end

    redirect_to admin_product_contributions_path, notice: 'Content Contributor was successfully updated.'
  end

  def destroy_permissions
    if params[:contributor_id].present?
      user = User.where(id: params[:contributor_id]).first

      Contribution.where(user_id: user.id, product_id: @product.id).destroy_all if user.present?
    end

    redirect_to admin_product_contributions_path, notice: 'Content Contributor was successfully removed.'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_content_contributors
    @contributors = User.all.collect { |u| u.email if u.can_contribute_to_product?(@product.id)}
    @contributors ||= []

    if params[:contributor_id].present?
      @user = User.where(id: params[:contributor_id]).first
      @contributors.push(@user.email) if @user.present?
    end
  end

  def product_contributors
    contributions = Contribution.where(product_id: @product.id)
    user_ids = contributions.distinct.pluck(:user_id)
    contributors = []

    if user_ids.present?
      user_ids.each do |uid|
        contributors << OpenStruct.new({user: User.find(uid),
                  manage: contributions.where(user_id: uid).pluck(:content_id).collect{ |cid| Content.find(cid) }}) unless uid.blank?
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
