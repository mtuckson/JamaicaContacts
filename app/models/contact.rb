class Contact < ApplicationRecord
  belongs_to :ecclesium, optional: true
  enum gender: { Male: "Male", Female: "Female"}

  geocoded_by :postal_address
  after_validation :geocode, if: :postal_address_changed?

  mount_uploader :avatar, AvatarUploader

  def full_name
    alias_string = self.alias.present? ? "\"#{self.alias}\"" : nil
    [bro_or_sis, first_name, alias_string, last_name].compact.join(' ')
  end

  def bro_or_sis
    if gender == "Male"
      return "Brother"

    elsif gender == "Female"
      return "Sister"
    end
  end
end
