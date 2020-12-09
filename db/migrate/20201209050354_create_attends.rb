class CreateAttends < ActiveRecord::Migration[5.2]
  def change
    create_table :attends do |t|
      t.integer :subject_time_id
      t.integer :user_id
      t.integer :status
      t.string :memo

      t.timestamps
    end
  end
end
