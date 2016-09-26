class ReplaceRelationshipWithRoleIdForUserProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_products, :relationship
    add_column :user_products, :role_id, :integer
  end
end
