class CreateSubModules < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_modules do |t|
      t.string :name
    end
  end
end
