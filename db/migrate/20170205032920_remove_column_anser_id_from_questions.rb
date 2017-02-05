class RemoveColumnAnserIdFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :answer_id, :string
  end
end
