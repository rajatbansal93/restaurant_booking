class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :min_guest
      t.integer :max_guest
      t.belongs_to :restaurants, index: true

      t.timestamps null: false
    end
  end
end
