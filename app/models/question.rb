class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :correct_answer, class_name: 'Answer', foreign_key: :answer_id
end
