class CreateHtmls < ActiveRecord::Migration[5.0]
  def change
    create_table :htmls do |t|
      t.string :name
      t.string :description
    end
  end
end
