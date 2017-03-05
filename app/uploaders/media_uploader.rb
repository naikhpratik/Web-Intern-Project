class MediaUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include CarrierWave::Backgrounder::Delay

  include CarrierWave::Video
  include CarrierWave::Audio

  # Choose what kind of storage to use for this uploader:
  storage :file

  # image
  version :image, if: :content_type_image

  # video
  version :video, if: :content_type_video do
    version :mp4 do
      process encode_video: [:mp4, { progress: :on_progress }]
    end

    version :webm do
      process encode_video: [:webm, { progress: :on_progress }]
    end
  end

  # audio
  version :audio, if: :content_type_audio do
    version :mp3 do
      process :convert => [:mp3]
    end
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
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

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

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
