class AddProductIdToContentManagers < ActiveRecord::Migration[5.0]
  def change
    add_reference :content_managers, :product, foreign_key: true
  end
end
