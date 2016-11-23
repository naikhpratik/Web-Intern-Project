class UserContent < ApplicationRecord
  belongs_to :user
  belongs_to :content

  def self.role product_id
    role = find_by_product_id(product_id) unless product_id.blank?
    role_id = find_by_product_id(product_id).role_id unless role.blank?
    Role.find(role_id).name unless role_id.blank?
  end

  def self.destroy_with_roles role_ids
    where(role_id: Role.all_except(role_ids)).destroy_all
  end
end
