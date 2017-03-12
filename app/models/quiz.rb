class Quiz < ApplicationRecord
  acts_as :content

  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  def import(file)
    encoding_options = {
        :invalid           => :replace,  # Replace invalid byte sequences
        :undef             => :replace,  # Replace anything not defined in ASCII
        :replace           => '',        # Use a blank for those replacements
        :universal_newline => true       # Always break lines with \n
    }

    self.questions.destroy_all
    CSV.foreach(file.path, headers: true) do |row|

      question_hash = row.to_hash
      clean_hash = {}
      question_hash.each do |key, value|
        key = key.downcase
        key = key.encode(Encoding.find('ASCII'), encoding_options) if key.present?
        value = value.encode(Encoding.find('ASCII'), encoding_options) if value.present?
        clean_hash[key] = value
      end
      self.questions.create!(clean_hash)
    end # end CSV.foreach
  end
end
