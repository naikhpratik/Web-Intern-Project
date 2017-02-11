class CreateProductAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :product_assets do |t|
      t.string :description
      t.string :uri

      t.timestamps
    end
  end
end
