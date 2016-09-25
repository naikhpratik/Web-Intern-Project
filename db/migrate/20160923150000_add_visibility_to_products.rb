class AddVisibilityToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :visibility, :string
  end
end
