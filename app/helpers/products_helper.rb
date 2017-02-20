module ProductsHelper
  def product_users pid
    user_products = UserProduct.where(product_id: pid) || []
    existing_users = user_products.collect { |up| up.user.id }.compact unless user_products.blank?
    
    users = User.where.not(id: existing_users)

    users.present? ? users.pluck(:username, :id) : []
  end

  def contents_to_array pid
    # TODO: This is a tmp solution. Find a better way.
    perm = Permission.where(id: pid) if pid.to_i > 0
    contents = perm.first.contents.tr(" '\"", "").scan(/\d+/) if perm.present?
    
    contents
  end
end
