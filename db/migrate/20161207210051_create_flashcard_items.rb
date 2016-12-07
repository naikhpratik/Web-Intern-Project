class CreateFlashcardItems < ActiveRecord::Migration[5.0]
  def change
    create_table :flashcard_items do |t|
      t.text :front
      t.text :back

      t.timestamps
    end
  end
end
