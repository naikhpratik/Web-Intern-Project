class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :isadmin, :bool, :default => 1
  end
end
