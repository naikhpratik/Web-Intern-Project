class RemoveSubModules < ActiveRecord::Migration[5.0]
  def change
    drop_table :sub_modules
  end
end
