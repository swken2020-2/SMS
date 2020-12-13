class AddPublicToSubjectTime < ActiveRecord::Migration[5.2]
  def change
    add_column :subject_times, :public, :boolean, default: false, null: false
  end
end
