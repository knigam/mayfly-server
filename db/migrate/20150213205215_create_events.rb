class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.integer :min
      t.integer :max
      t.boolean :open
      t.boolean :active

      t.timestamps
    end
  end
end
