class Flashcard < ApplicationRecord
  acts_as :content

  has_many :flashcard_items, dependent: :destroy
  accepts_nested_attributes_for :flashcard_items, reject_if: :all_blank, allow_destroy: true

  def items
    flashcard_items
  end
end
