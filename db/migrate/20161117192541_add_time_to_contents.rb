class AddTimeToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :time, :integer
  end
end
