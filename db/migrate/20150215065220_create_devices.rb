class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :reg_id
      t.integer :user_id
      t.string :type
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
