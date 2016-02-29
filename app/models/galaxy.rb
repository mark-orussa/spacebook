class Galaxy < ActiveRecord::Base
  belongs_to :user
  has_one :privacy_level
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def get_user(user_id)
    User.find(user_id)
  end

  def self.find_friends(search_for, current_user_id)
    user = User.arel_table
    query_string = "%#{search_for}%"
    return User.select(user[:id], user[:email])
               .where(user[:email].matches(query_string))
               .where(user[:id].not_eq(current_user_id))
               .where("id NOT IN (SELECT user_id AS friendID FROM #{:friends} WHERE #{:friend_id} = #{current_user_id} UNION SELECT #{:friend_id} AS friendID FROM #{:friends} WHERE user_id = #{current_user_id})")
               .order(user[:email])
  end

  def self.add_friend(sender_id, receiver_id)
    ActiveRecord::Base.transaction do
      Friend.find_or_create_by(user_id: sender_id, friend_id: receiver_id)
      add_notification(sender_id, receiver_id, 1)
    end
  end

  def self.get_friends(current_user_id)
    User.where("id IN (SELECT #{:user_id} AS friendID FROM #{:friends} WHERE #{:friend_id} = #{current_user_id} UNION SELECT #{:friend_id} AS friendID FROM #{:friends} WHERE #{:user_id} = #{current_user_id})").order(:fName)
  end

  def self.add_notification(sender_id, receiver_id, notification_id)
    Notification.find_or_create_by(sender_id: sender_id, receiver_id: receiver_id, notification_type_id: notification_id)
  end

  def self.get_notification_count(receiver_id)
    Notification.where(receiver_id: receiver_id).where(viewed: nil).count
  end

  def self.get_notifications(receiver_id)
    @notifications = NotificationType.select('*').joins(:users).where('notifications.receiver_id = ?', receiver_id).where('notifications.viewed IS NULL')#notification_types.short, notifications.sender_id, notifications.created_at, notifications.viewed
  end
end
