class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.binary :icon
      t.string :type

      t.timestamps
    end
  end
end
