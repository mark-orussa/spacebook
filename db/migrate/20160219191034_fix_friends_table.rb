class FixFriendsTable < ActiveRecord::Migration
  def change
    rename_column :friends, :sender, :user_id
    rename_column :friends, :receiver, :friend_id
  end
end
