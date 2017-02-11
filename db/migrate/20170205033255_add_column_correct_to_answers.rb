class AddColumnCorrectToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :correct, :boolean
  end
end
