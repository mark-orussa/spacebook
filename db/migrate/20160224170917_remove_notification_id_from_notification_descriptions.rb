class RemoveNotificationIdFromNotificationDescriptions < ActiveRecord::Migration
  def change
    remove_column :notification_descriptions, :notification_id
  end
end
