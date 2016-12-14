require 'csv'
class Content < ApplicationRecord
  CONTENT_TYPES = ['Modulee', 'Quiz', 'Flashcard', 'Html', 'Audio', 'Video']

  actable
  has_ancestry

  has_many :contributions, dependent: :destroy
  has_many :users, through: :contributions
  has_many :user_contents, dependent: :destroy
  has_many :users,  through: :user_contents

  validates :name, presence: true

  belongs_to :product
end
