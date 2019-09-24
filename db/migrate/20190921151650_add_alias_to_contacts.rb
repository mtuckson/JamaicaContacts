class AddAliasToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :alias, :string
  end
end
