class Content < ApplicationRecord
  CONTENT_TYPES = ['Modulee', 'SubModule', 'Quiz', 'Flashcard', 'Html', 'Audio', 'Video']

  actable
  has_ancestry

  has_many :content_managers, dependent: :destroy
  has_many :users, through: :content_managers

  validates :name, presence: true

  belongs_to :product

  searchable do
    text :name
  end
end
