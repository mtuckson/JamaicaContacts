class AddSecondPhoneToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :second_phone, :string
  end
end
