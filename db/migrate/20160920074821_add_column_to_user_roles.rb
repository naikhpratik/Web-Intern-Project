class AddColumnToUserRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :user_roles, :user_id, :integer
    add_column :user_roles, :role_id, :integer
  end
end
