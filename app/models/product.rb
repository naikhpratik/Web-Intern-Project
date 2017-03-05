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

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, packed: false, file_warning: :ignore)
    when ".xls" then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
