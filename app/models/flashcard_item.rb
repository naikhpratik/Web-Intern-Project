class FlashcardItem < ApplicationRecord
  belongs_to :flashcard

  include RankedModel
  ranks :row_order, class_name: 'FlashcardItem'
end
