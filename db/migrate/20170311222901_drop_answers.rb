class DropAnswers < ActiveRecord::Migration[5.0]
  def change
    drop_table :answers if data_source_exists?(:answers)
  end
end
