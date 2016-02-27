class ChangeNotificationDescriptionId < ActiveRecord::Migration
  def change
    rename_column :notifications, :notification_description_id, :notification_type_id
  end
end
