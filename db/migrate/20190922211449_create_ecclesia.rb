class CreateEcclesia < ActiveRecord::Migration[6.0]
  def change
    create_table :ecclesia do |t|
      t.string :name
      t.string :postal_address
      t.float :longitude
      t.float :latitude
      t.text :notes
      t.integer :recording_brother

      t.timestamps
    end
  end
end
