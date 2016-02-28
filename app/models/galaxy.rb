class Galaxy < ActiveRecord::Base
  belongs_to :user
  has_one :privacy_level
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def get_user(galaxy)
    User.find(galaxy.author)
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

  def self.add_friend(friend_id, current_user_id)
    Friend.create(user_id: current_user_id, friend_id: friend_id)
  end

  def self.get_friends(current_user_id)
    User.where("id IN (SELECT #{:user_id} AS friendID FROM #{:friends} WHERE #{:friend_id} = #{current_user_id} UNION SELECT #{:friend_id} AS friendID FROM #{:friends} WHERE #{:user_id} = #{current_user_id})").order(:email)
  end
end
