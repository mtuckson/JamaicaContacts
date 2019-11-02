class Ecclesium < ApplicationRecord
  has_many :contacts
  has_one :recording_brother, class_name: 'Contact', foreign_key: 'recording_brother_id'

  geocoded_by :postal_address
  after_validation :geocode, if: :postal_address_changed?

  mount_uploader :avatar, AvatarUploader
end
