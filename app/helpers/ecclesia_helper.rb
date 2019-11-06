module EcclesiaHelper


  def display_ecclesium_postal_address (ecclesium)
    return "-" if ecclesium.postal_address.blank?

    ecclesium.postal_address
  end

  def display_ecclesium_coordinates (ecclesium)
    if (ecclesium.latitude.blank?) || (ecclesium.longitude.blank?)
      return "Unknown Location"
    end

    return "#{ecclesium.latitude}, #{ecclesium.longitude}"
  end

  def display_ecclesium_notes (ecclesium)
    return "-" if ecclesium.notes.blank?

    ecclesium.notes
  end


end
