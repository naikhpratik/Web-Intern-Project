class AddForeignkeyToContents < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :contents, :products
  end
end
