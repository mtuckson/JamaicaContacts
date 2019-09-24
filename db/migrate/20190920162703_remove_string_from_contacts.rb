class RemoveStringFromContacts < ActiveRecord::Migration[6.0]
  def change

    remove_column :contacts, :string, :string
  end
end
