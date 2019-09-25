class RemoveRecordingBrotherFromEcclesium < ActiveRecord::Migration[6.0]
  def change

    remove_column :ecclesia, :recording_brother, :integer
  end
end
