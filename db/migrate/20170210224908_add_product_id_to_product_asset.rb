class AddProductIdToProductAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :product_assets, :product_id, :integer
  end
end
