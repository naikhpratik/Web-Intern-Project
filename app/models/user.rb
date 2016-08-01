class User < ApplicationRecord

  #attr_accessor :name, :password, :password_confirmation

  validates :name , :presence => true
  has_secure_password
end
