module MediaHelper
  def default_source_tmp_path media
    return "" if media.blank?
    if media.source_url.blank? && media.source_tmp.present?
      "/uploads/tmp/" << media.source_tmp 
    elsif media.source_url.present?
      media.source_url
    else
      ""
    end
  end
end