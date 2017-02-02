class AddQuestionReferenceToQuizQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :quiz_questions, :question, foreign_key: true
  end
end
