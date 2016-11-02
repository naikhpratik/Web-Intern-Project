class Content < ApplicationRecord
  CONTENT_TYPES = ['Modulee', 'SubModule', 'Quiz', 'Flashcard', 'Html', 'Audio', 'Video']

  actable
  has_ancestry

  has_many :contributions, dependent: :destroy
  has_many :users, through: :contributions

  validates :name, presence: true

  belongs_to :product

  searchable do
    text :name
  end
end
