class Media < ApplicationRecord
  acts_as :content
  
  mount_uploader :source, MediaUploader
  process_in_background :source

  MEDIA_TYPES = ['Image', 'Audio', 'Video']

  validate :is_valid_media_local_type?
  validates_presence_of :caption

  def is_valid_media_local_type?
    errors.add(:local_type, "must be #{MEDIA_TYPES.join(' or ')}") unless MEDIA_TYPES.include?(local_type.capitalize)
  end
end
