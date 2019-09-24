class Ecclesium < ApplicationRecord
  has_many :contacts
  has_one :recording_brother, class_name: 'Contact', foreign_key: 'recording_brother_id' 
end
