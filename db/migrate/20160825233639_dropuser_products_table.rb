class DropuserProductsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :user_products
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
