class AddRecordingBrotherIdToEcclesia < ActiveRecord::Migration[6.0]
  def change
    add_column :ecclesia, :recording_brother_id, :integer
    add_index :ecclesia, :recording_brother_id
  end
end
