class AddAssetKindToProductAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :product_assets, :kind, :integer
  end
end
