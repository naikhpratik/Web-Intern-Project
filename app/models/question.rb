class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :correct_answer, class_name: 'Answer', foreign_key: :answer_id

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
