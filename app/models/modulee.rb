class Modulee < ApplicationRecord
  acts_as :content

  validates :attr_1, presence: true, uniqueness: true
end
