class Galaxy < ActiveRecord::Base
  belongs_to :user

  def self.find_friends(search_for, current_user)
    user = User.arel_table
    query_string = "%#{search_for}%"
    return User.select('id,email')
               .where(user[:email].matches(query_string))
               .where(user[:email].not_eq(current_user.email))
               .where("id NOT IN (SELECT user_id AS friendID FROM friends WHERE recipient_id = #{current_user.id} UNION SELECT recipient_id AS friendID FROM friends WHERE user_id = #{current_user.id})")

  end

  def self.add_friend(params, current_user)
    Friend.create(user_id: current_user, recipient_id: params[:friend_id])
  end

  def self.get_friends(current_user)
    User.where("id IN (SELECT user_id AS friendID FROM friends WHERE recipient_id = #{current_user.id} UNION SELECT recipient_id AS friendID FROM friends WHERE user_id = #{current_user.id})")
  end
end
