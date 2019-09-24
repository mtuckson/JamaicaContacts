class Contact < ApplicationRecord
    belongs_to :ecclesium, optional: true
   enum gender: { Male: "Male", Female: "Female"}

   def full_name
    "#{first_name} #{last_name}".strip
  end
end
