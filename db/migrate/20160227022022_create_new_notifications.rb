class CreateNewNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :notification_description_id
      t.boolean :viewed

      t.timestamps
    end
  end
end
