class Product < ApplicationRecord
  VISIBILITY_ALL = "All"
  VISIBILITY_REGISTERED_USERS = "Registered Users"
  VISIBILITY_PRIVILEGED_USERS = "Privileged Users"

  validates :name, presence: true, uniqueness: true
  validates :visibility, presence: true

  has_many :user_products
  has_many :users, :through => :user_products
end
