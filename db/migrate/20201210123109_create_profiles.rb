class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.binary :icon
      t.string :icontype
      t.integer :role

      t.timestamps
    end
  end
end
