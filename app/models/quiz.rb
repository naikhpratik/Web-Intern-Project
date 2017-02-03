class Quiz < ApplicationRecord
  acts_as :content

  has_many :quiz_questions, dependent: :destroy
  has_many :questions, through: :quiz_questions

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
