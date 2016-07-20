class AddDefaultValueToIsadminAttribute < ActiveRecord::Migration[5.0]
  def up
  change_column :users, :isadmin, :boolean, :default => false
end

def down
  change_column :users, :isadmin, :boolean, :default => nil
end
end
