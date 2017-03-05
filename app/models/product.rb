class Product < ApplicationRecord
  VISIBILITY_ALL = "All"
  VISIBILITY_REGISTERED_USERS = "Registered Users"
  VISIBILITY_PRIVILEGED_USERS = "Privileged Users"

  validates :title, presence: true, uniqueness: true
  validates :visibility, presence: true

  has_many :permissions, dependent: :destroy
  has_many :users, through: :permissions
  accepts_nested_attributes_for :permissions, reject_if: :all_blank, allow_destroy: true

  has_many :user_subscriptions, dependent: :destroy
  has_many :subscribed_users, through: :user_subscriptions, class_name: 'User', foreign_key: :user_id, source: :user

  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :contents, reject_if: :all_blank, allow_destroy: true

  has_many :product_assets
<<<<<<< HEAD



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
=======
>>>>>>> master
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, packed: false, file_warning: :ignore)
    when ".xls" then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
