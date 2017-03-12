class DropQuizQuestions < ActiveRecord::Migration[5.0]
  def change
    drop_table :quiz_questions, if data_source_exists?(:quiz_questions)
  end
end
