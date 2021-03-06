module ProductsHelper
  # Get all the non-admin users who aren't contributing to this product
  def non_contributing_users pid
    users = User.non_admins
    users.present? ? users.pluck(:username, :id) : []
  end

  def contents_to_array perm_id
    # TODO: This is a tmp solution. Find a better way.
    perm = Permission.where(id: perm_id) if perm_id.to_i > 0
    contents = perm.first.contents if perm.present?
    
    contents
  end
end
