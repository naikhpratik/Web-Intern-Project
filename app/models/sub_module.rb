class SubModule < ApplicationRecord
  acts_as :content

  validates :attr_2, presence: true, uniqueness: true
end
