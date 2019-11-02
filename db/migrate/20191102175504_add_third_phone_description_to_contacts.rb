class AddThirdPhoneDescriptionToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :third_phone_description, :string
  end
end
