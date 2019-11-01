module ContactsHelper
  def avatar_url(contact)
    return asset_path('empty-contact.png') if contact.avatar_url.blank?

    contact.avatar_url
  end
end
