class AddReferencesToQuizQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :quiz_questions, :quiz, foreign_key: true

    # remove these column as they'll be moved to Question table
    remove_column :quiz_questions, :question
    remove_column :quiz_questions, :hint
    remove_column :quiz_questions, :content_id
    remove_column :quiz_questions, :question_type
    remove_column :quiz_questions, :correct
    remove_column :quiz_questions, :distractors
    remove_column :quiz_questions, :explination
  end
end
