class RenameTypeToQuestionTypeForQuizzesTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :quizzes, :type, :q_type
  end
end
