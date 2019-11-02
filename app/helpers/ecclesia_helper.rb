module EcclesiaHelper
  def avatar_url(ecclesia)
    return asset_path('empty-contact.png') if ecclesia.avatar_url.blank?

    ecclesia.avatar_url
  end
end
