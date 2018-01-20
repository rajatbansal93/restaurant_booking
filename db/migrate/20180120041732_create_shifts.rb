class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.string :opening_time
      t.string :closing_time
      t.belongs_to :restaurants, index: true

      t.timestamps null: false
    end
  end
end
