class CreateAttendManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :attend_managers do |t|
      t.integer :subject_id
      t.integer :subject_time_id
      t.datetime :expired

      t.timestamps
    end
  end
end
