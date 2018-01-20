class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.time :opening_time
      t.time :closing_time
      t.belongs_to :restaurant, index: true

      t.timestamps null: false
    end
  end
end
