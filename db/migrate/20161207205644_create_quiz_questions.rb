class CreateQuizQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz_questions do |t|
      t.text :question
      t.text :hint
      t.integer :content_id
      t.string :question_type
      t.text :correct
      t.text :distractors
      t.text :explination

      t.timestamps
    end
  end
end
