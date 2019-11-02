class AddSecondPhoneDescriptionToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :second_phone_description, :string
  end
end
