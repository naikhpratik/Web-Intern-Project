class AddRemoveColumnsForDiffTables < ActiveRecord::Migration[5.0]
  def change
    add_column :htmls, :description, :text
    remove_column :flashcards, :attr_4
    remove_column :modulees, :attr_1
    remove_column :sub_modules, :attr_2
    remove_column :quizzes, :attr_3
  end
end
