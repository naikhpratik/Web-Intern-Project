class RemoveColumnContentsName < ActiveRecord::Migration[5.0]
  def change
    remove_column :contents, :name
  end
end
