class Notification < ActiveRecord::Base
  belongs_to :user, foreign_key: :sender_id
  belongs_to :notification_type, foreign_key: :notification_type_id
end
