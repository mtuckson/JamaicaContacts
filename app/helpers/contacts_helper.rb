module ContactsHelper
  def avatar_url(contact)
    return asset_path('empty-contact.png') if contact.avatar_url.blank?

    contact.avatar_url
  end

  def display_contact_second_phone (contact)
    return "" if contact.second_phone.blank?

    phone_only_numbers = contact.second_phone.gsub(/[^0-9]/, '')
    if phone_only_numbers.size == 11
      return phone_only_numbers.gsub(/^(\d{1})(\d{3})(\d{3})(\d{4})$/, '+\1 (\2) \3-\4')
    end
    if phone_only_numbers.size == 10
      return phone_only_numbers.gsub(/^(\d{3})(\d{3})(\d{4})$/, '(\1) \2-\3')
    end
    if phone_only_numbers.size ==7
      return phone_only_numbers.gsub(/^(\d{3})(\d{4})$/, '\1-\2')
    end
    return contact.second_phone
  end


  def display_contact_third_phone (contact)
    return "" if contact.third_phone.blank?

    phone_only_numbers = contact.third_phone.gsub(/[^0-9]/, '')
    if phone_only_numbers.size == 11
      return phone_only_numbers.gsub(/^(\d{1})(\d{3})(\d{3})(\d{4})$/, '+\1 (\2) \3-\4')
    end
    if phone_only_numbers.size == 10
      return phone_only_numbers.gsub(/^(\d{3})(\d{3})(\d{4})$/, '(\1) \2-\3')
    end
    if phone_only_numbers.size ==7
      return phone_only_numbers.gsub(/^(\d{3})(\d{4})$/, '\1-\2')
    end
    return contact.third_phone
  end


  def display_contact_phone_number (contact)
    return "" if contact.phone_number.blank?

    phone_only_numbers = contact.phone_number.gsub(/[^0-9]/, '')
    if phone_only_numbers.size == 11
      return phone_only_numbers.gsub(/^(\d{1})(\d{3})(\d{3})(\d{4})$/, '+\1 (\2) \3-\4')
    end
    if phone_only_numbers.size == 10
      return phone_only_numbers.gsub(/^(\d{3})(\d{3})(\d{4})$/, '(\1) \2-\3')
    end
    if phone_only_numbers.size ==7
      return phone_only_numbers.gsub(/^(\d{3})(\d{4})$/, '\1-\2')
    end
    return contact.phone_number
  end

  def display_contact_email_address (contact)
    return "" if contact.email_address.blank?

    contact.email_address
  end

  def display_contact_postal_address (contact)
    return "" if contact.postal_address.blank?

    contact.postal_address
  end

  def display_contact_birth_date (contact)
    return "" if contact.birth_date.blank?

    contact.birth_date
  end

  def display_contact_notes (contact)
    return "" if contact.notes.blank?

    contact.notes
  end

  def display_contact_phone_number_description (contact)
    return "Primary Phone" if contact.phone_description.blank?

    "#{contact.phone_description}"
  end

  def display_contact_second_phone_description (contact)
    return "" if contact.second_phone_description.blank?

    "#{contact.second_phone_description}"
  end

  def display_nickname(contact)
    "(#{contact.nickname})"

  end

  def display_contact_third_phone_description (contact)
    return "" if contact.third_phone_description.blank?

    "#{contact.third_phone_description}"
  end

  def display_contact_coordinates (contact)
    if (contact.latitude.blank?) || (contact.longitude.blank?)
      return "Unknown Location"
    end

    return "#{contact.latitude}, #{contact.longitude}"
  end



end
