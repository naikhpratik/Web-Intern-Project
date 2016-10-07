class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_products, dependent: :destroy
  has_many :products, through: :user_products

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  validates :username, presence: true, uniqueness: true

  def self.all_except(user)
    where.not(id: user)
  end

  def is_admin?
    is_type?("Admin")
  end

  def is_product_manager?
    is_type?("Product Manager")
  end

  def is_content_manager?
    is_type?("Content Manager")
  end

  private

  def is_type? type
    self.roles.map(&:name).include?(type) ? true : false
  end

end
