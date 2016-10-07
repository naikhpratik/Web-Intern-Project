class Product < ApplicationRecord
  VISIBILITY_ALL = "All"
  VISIBILITY_REGISTERED_USERS = "Registered Users"
  VISIBILITY_PRIVILEGED_USERS = "Privileged Users"

  validates :title, presence: true, uniqueness: true
  validates :visibility, presence: true

  has_many :user_products, dependent: :destroy
  has_many :users, through: :user_products

  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :contents, reject_if: :all_blank, allow_destroy: true

  def update params
    if params[:contents_attributes].presence
      contents_attributes = params[:contents_attributes]

      contents_attributes.each do |atr|
        type = contents_attributes[atr][:actable_type]
        columns = type.constantize.column_names

        model_attributes = contents_attributes[atr]
        model_attributes[:product_id] = self.id if self.id.present?

        if model_attributes[:_destroy].to_i === 1
          type.constantize.destroy(model_attributes.delete(:id))
        else
          model_attributes.delete(:_destroy)

          if model_attributes[:id].present?
            type.constantize.update(model_attributes.delete(:id), model_attributes)
          else
            type.constantize.create(model_attributes)
          end
        end
      end

      params.delete(:contents_attributes)

      self.update_attributes(params)
      self
    end
  end
end
