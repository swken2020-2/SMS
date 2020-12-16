class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.integer :subject_time_id
      t.string :name
      t.binary :file
      t.string :filetype

      t.timestamps
    end
  end
end
