class AddForeignKeyToUserProducts < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :user_products, :users
  end
end
