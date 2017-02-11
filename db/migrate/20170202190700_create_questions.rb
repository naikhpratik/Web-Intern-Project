class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :hint
      t.text :explanation
      t.references :answer
    end
  end
end
