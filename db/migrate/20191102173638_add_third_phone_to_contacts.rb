class AddThirdPhoneToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :third_phone, :string
  end
end
