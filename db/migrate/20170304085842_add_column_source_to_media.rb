class AddColumnSourceToMedia < ActiveRecord::Migration[5.0]
  def change
    add_column :media, :source, :string
  end
end
