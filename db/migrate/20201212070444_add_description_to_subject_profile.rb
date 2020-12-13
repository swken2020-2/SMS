class AddDescriptionToSubjectProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :subject_profiles, :description, :string
  end
end
