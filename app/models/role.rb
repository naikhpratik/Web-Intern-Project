class Role < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  
  has_many :user_roles
  has_many :users, through: :user_roles

  def self.all_except ids
    where.not(id: ids).map(&:id)
  end

  def self.non_admin_roles
    where.not(name: 'Admin').pluck(:name, :id)
  end
end
