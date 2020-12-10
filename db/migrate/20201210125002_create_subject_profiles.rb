class CreateSubjectProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_profiles do |t|
      t.integer :subject_id
      t.binary :image
      t.string :icontype
      t.integer :teacher_id

      t.timestamps
    end
  end
end
