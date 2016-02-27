class ChangeNotificationDescriptionName < ActiveRecord::Migration
  def self.up
    rename_table :notification_descriptions, :notification_types
  end
  def self.down
    rename_table :notification_types, :notification_descriptions
  end
end
