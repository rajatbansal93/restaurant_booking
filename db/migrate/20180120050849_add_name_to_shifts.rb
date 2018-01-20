class AddNameToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :name, :string
  end
end
