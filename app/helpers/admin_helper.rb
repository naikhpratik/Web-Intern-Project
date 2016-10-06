module AdminHelper
  def user_dashboard_link
    if current_user.is_admin? || current_user.is_product_manager? || current_user.is_content_manager?
      link_to current_user.roles.first.name, dashboard_path
    else
      link_to 'My Products', dashboard_path
    end
  end
end
