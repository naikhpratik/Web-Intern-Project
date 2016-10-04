class Product < ApplicationRecord
  VISIBILITY_ALL = "All"
  VISIBILITY_REGISTERED_USERS = "Registered Users"
  VISIBILITY_PRIVILEGED_USERS = "Privileged Users"

  validates :title, presence: true, uniqueness: true
  validates :visibility, presence: true

  has_many :user_products, dependent: :destroy
  has_many :users, through: :user_products

  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :contents, allow_destroy: true
end
