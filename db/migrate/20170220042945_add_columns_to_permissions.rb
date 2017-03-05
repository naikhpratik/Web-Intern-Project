class AddColumnsToPermissions < ActiveRecord::Migration[5.0]
  def change
    add_reference :permissions, :role, foreign_key: true
    add_column :permissions, :contents, :text
  end
end
