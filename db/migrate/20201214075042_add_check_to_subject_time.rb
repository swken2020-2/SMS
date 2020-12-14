class AddCheckToSubjectTime < ActiveRecord::Migration[5.2]
  def change
    add_column :subject_times, :check, :boolean, default: false, null: false
  end
end
