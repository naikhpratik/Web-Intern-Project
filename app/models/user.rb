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

  def has_role? (role)
    if role.instance_of? Array
      role = role.collect { |r| r.to_s.split('_').join(' ').titleize }
      (roles.pluck(:name) & role).empty?
    else
      role.to_s.to_i > 0 ? (roles.pluck(:id).include? role.to_i) : (roles.pluck(:name).include? role.to_s.split('_').join(' ').titleize)
    end
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

  def is_content_contributor?
    is_type?("Content Contributor")
  end

  def is_instructor?
    is_type?("Instructor")
  end

  private

  def is_type? type
    self.roles.map(&:name).include?(type) ? true : false
  end

end
