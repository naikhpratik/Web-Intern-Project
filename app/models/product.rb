class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :user_products
  has_many :contents
  has_many :users, :through => :user_products
  accepts_nested_attributes_for :contents, allow_destroy: true
end
