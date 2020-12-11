class AddNumberToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :number, :integer
  end
end
