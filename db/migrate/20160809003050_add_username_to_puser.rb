class AddUsernameToPuser < ActiveRecord::Migration[5.0]
  def change
    add_column :pusers, :username, :string
    add_column :pusers, :isadmin, :bool, :default => false
  end
end
