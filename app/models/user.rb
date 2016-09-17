class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :user_products, :dependent => :destroy
  has_many :products, :through=> :user_products
  #attr_accessor :email, :password, :password_confirmation, :remember_me, :username

  #validates_presence_of :username

  #validates :email, :uniqueness => :true

  def self.all_except(user)
    where.not(id: user)
  end

  end
