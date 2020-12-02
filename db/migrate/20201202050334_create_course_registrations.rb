class CreateCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :course_registrations do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
