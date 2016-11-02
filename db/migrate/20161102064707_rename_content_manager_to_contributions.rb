class RenameContentManagerToContributions < ActiveRecord::Migration[5.0]
  def change
    rename_table :content_managers, :contributions
  end
end
