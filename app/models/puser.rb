class Puser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessor :email, :password, :password_confirmation, :remember_me, :username

  #validates_presence_of :username

  #validates :email, :uniqueness => :true

  end
