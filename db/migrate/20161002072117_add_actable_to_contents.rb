class AddActableToContents < ActiveRecord::Migration[5.0]
  def change
    change_table :contents do |t|
      t.actable
    end
  end
end
