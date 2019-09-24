class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :string
      t.string :email_address
      t.string :postal_address
      t.float :latitude
      t.float :longitude
      t.date :birth_date
      t.boolean :baptism_status
      t.text :notes

      t.timestamps
    end
  end
end
