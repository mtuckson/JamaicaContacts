class AddGenderToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :gender, :string #boolean?
  end
end
