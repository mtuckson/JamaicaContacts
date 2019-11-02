class AddAvatarToEcclesia < ActiveRecord::Migration[6.0]
  def change
    add_column :ecclesia, :avatar, :string
  end
end
