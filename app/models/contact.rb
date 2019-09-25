class Contact < ApplicationRecord
    belongs_to :ecclesium, optional: true
   enum gender: { Male: "Male", Female: "Female"}

   geocoded_by :postal_address
   after_validation :geocode, if: :postal_address_changed?

   def full_name
    "#{first_name} #{last_name}".strip
  end
end
