class CreateUserProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_products do |t|
      t.string :relationship
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
