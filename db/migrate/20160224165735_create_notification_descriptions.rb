class CreateNotificationDescriptions < ActiveRecord::Migration
  def change
    create_table :notification_descriptions do |t|
      t.integer :notification_id
      t.string :description

      t.timestamps
    end
  end
end
