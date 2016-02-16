class ChangeFriendsRecipientColumnName < ActiveRecord::Migration
  def change
    rename_column :friends, :recipient_id, :friend_id
  end
end
