class Quiz < ApplicationRecord
  acts_as :content

  has_many :quiz_questions, dependent: :destroy
  has_many :questions, through: :quiz_questions
end
