module ContactsHelper
  def ecclesium_link(ecclesium)
    return 'N/A' if ecclesium.nil?

    link_to ecclesium.name, ecclesium_path(ecclesium)
  end
end
