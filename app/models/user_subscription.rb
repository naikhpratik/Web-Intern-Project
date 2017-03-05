class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def self.subscription_current?(user, product)
    subscription = UserSubscription.where(user_id: user).where(product_id: product).take
    subscription.present?
  end

end
