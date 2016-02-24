class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notification_id
      t.boolean :viewed

      t.timestamps
    end
  end
end
