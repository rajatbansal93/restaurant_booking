class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.integer :guest_count
      t.belongs_to :tables, index: true
      t.belongs_to :guests, index: true
    end
  end
end
