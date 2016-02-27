class AddShortToNotificationDescriptions < ActiveRecord::Migration
  def change
    add_column :notification_descriptions, :short, :string, after: :id
  end
end
