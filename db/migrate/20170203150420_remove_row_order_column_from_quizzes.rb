class RemoveRowOrderColumnFromQuizzes < ActiveRecord::Migration[5.0]
  def change
    remove_column :quizzes, :row_order, :string
  end
end
