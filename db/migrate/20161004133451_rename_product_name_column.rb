class RenameProductNameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :name, :title
  end
end
