class MediaUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::Backgrounder::Delay

  include CarrierWave::Video
  include CarrierWave::Audio

  # S3 for storage
  storage :fog

  # Create different versions of uploaded files:
  # Image
  version :image, if: :content_type_image

  version :image do
    version :large do
      process resize_to_fit: [500, 500]
    end

    version :medium, from_version: :large do
      process resize_to_fit: [250, 250]
    end

    version :thumb, from_version: :medium do
      process resize_to_fit: [100, 100]
    end
  end

  # Video
  version :video, if: :content_type_video do
    version :mp4 do
      process encode_video: [:mp4, { progress: :on_progress }]
    end

    version :webm do
      process encode_video: [:webm, { progress: :on_progress }]
    end
  end

  # Audio
  version :audio, if: :content_type_audio do
    version :mp3 do
      process :convert => [:mp3]
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  private

  def content_type_image media
    %w[image/jpg image/jpeg image/png image/gif].include? media.content_type
  end

  def content_type_video media
    %w[application/mp4 application/webm].include? media.content_type
  end

  def content_type_audio media
    %w[audio/mpeg].include? media.content_type
  end

end
