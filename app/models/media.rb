class Media < ApplicationRecord
  acts_as :content

  MEDIA_TYPES = ['Audio', 'Video']

  validate :is_valid_media_local_type?
  validates_presence_of :caption

  def is_valid_media_local_type?
    errors.add(:local_type, "must be Audio or Video") unless MEDIA_TYPES.include?(local_type.capitalize)
  end
end
