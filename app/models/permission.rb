class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :role

  validates_presence_of :user, :product, :role, :contents

  def contents
    contents = read_attribute(:contents)
    contents && contents.tr(" '\"", "").scan(/\d+/)
  end
end
