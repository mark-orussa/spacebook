class NotificationType < ActiveRecord::Base
  has_many :notifications, foreign_key: :notification_type_id
  has_many :users, :through => :notifications
end
