class Galaxy < ActiveRecord::Base
  # has_many :friends
  belongs_to :user

  def self.find_friends(params,current_user)
    user = User.arel_table
    query_string = "%#{params[:find_friends]}%"
    return User.where(user[:email].matches(query_string)).where(user[:email].not_eq( current_user.email))
  end

  def self.add_friend(params,current_user)
    Friend.create(sender: current_user, receiverparams[:
  end
end
