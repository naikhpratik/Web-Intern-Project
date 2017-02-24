class RemoveUserContentAndContributionRefs < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :contributions, :products if table_exists?(:contributions) && column_exists?(:contributions, :product_id)
    remove_foreign_key :user_contents, :users if table_exists?(:user_contents) && column_exists?(:user_contents, :user_id)

    drop_table :contributions if table_exists?(:contributions)
    drop_table :user_contents if table_exists?(:user_contents)
  end
end
