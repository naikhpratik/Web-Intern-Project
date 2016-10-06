class AddRemoveColumnsToMiscTables < ActiveRecord::Migration[5.0]
  def change
    # Remove Columns
    remove_column :modulees, :name
    remove_column :sub_modules, :name
    remove_column :audios, :name
    remove_column :videos, :name
    remove_column :quizzes, :name
    remove_column :flashcards, :name
    remove_column :htmls, :name

    # Add Columns
    add_column :contents, :name, :string
    add_column :contents, :view_count, :integer

    add_column :modulees, :attr_1, :string
    add_column :sub_modules, :attr_2, :string
    add_column :audios, :play_count, :integer
    
    add_column :videos, :url, :string
    add_column :videos, :play_count, :integer
    
    add_column :quizzes, :attr_3, :string
    add_column :flashcards, :attr_4, :string
    
    add_column :htmls, :has_plain_text, :boolean
  end
end
