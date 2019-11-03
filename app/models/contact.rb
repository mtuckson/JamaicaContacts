class Contact < ApplicationRecord
  belongs_to :ecclesium, optional: true
  enum gender: { Male: "Male", Female: "Female"}

  geocoded_by :postal_address
  after_validation :geocode, if: :postal_address_changed?

  mount_uploader :avatar, AvatarUploader

  def baptized?
    baptism_status == true
  end

  def full_name
    [bro_or_sis, first_name, last_name].compact.join(' ')
  end

  def nickname
    self.alias
  end

  def bro_or_sis
    return nil unless baptized?
    Male? ? 'Bro.' : 'Sis.'
  end
end
