class CreateModulees < ActiveRecord::Migration[5.0]
  def change
    create_table :modulees do |t|
      t.string :name
    end
  end
end
