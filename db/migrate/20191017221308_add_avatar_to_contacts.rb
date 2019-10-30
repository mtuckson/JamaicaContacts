class AddAvatarToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :avatar, :string
  end
end
