class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.integer :guest_count
      t.belongs_to :table, index: true
      t.belongs_to :guest, index: true

      t.timestamps null: false
    end
  end
end
