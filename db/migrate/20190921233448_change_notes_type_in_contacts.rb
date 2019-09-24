class ChangeNotesTypeInContacts < ActiveRecord::Migration[6.0]
  def change
      change_column :contacts, :notes, :text
  end
end
