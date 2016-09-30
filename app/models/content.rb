class Content < ApplicationRecord
  belongs_to :product, :foreign_key => "product_id"
end
