class CreateSubjectTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_times do |t|
      t.integer :subject_id
      t.string :title

      t.timestamps
    end
  end
end
