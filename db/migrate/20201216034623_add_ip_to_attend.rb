class AddIpToAttend < ActiveRecord::Migration[5.2]
  def change
    add_column :attends, :ip, :string
  end
end
