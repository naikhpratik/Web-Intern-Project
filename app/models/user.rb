class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_products, :dependent => :destroy
  has_many :products, :through=> :user_products

  has_many :user_roles
  has_many :roles, :through => :user_roles

  def self.all_except(user)
    where.not(id: user)
  end

end
