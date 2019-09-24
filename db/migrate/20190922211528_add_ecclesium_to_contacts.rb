class AddEcclesiumToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :ecclesium_id, :integer
    add_index :contacts, :ecclesium_id
  end
end
