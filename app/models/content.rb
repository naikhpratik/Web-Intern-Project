require 'csv'
class Content < ApplicationRecord
  CONTENT_TYPES = ['Modulee', 'Quiz', 'Flashcard', 'Html', 'Media']

  include RankedModel
  ranks :row_order, class_name: 'Content'

  actable
  has_ancestry

  has_many :contributions, dependent: :destroy
  has_many :users, through: :contributions
  has_many :user_contents, dependent: :destroy
  has_many :users,  through: :user_contents

  validates :name, presence: true

  belongs_to :product


  def printable_type
    return self.actable_type == 'Modulee' ? 'Module' : self.actable_type
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, packed: false, file_warning: :ignore)
    when ".xls" then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
