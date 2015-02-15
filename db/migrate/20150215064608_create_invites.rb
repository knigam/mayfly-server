class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :attending, default: false, null: false
      t.boolean :creator, default: false, null: false

      t.timestamps
    end
  end
end
