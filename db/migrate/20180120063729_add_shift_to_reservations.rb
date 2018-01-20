class AddShiftToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :shift, :string
  end
end
