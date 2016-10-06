class AddNameToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :name, :string
  end
end
