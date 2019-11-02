class AddPhoneDescriptionToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :phone_description, :string
  end
end
