class RenameFriendsColumnReciever < ActiveRecord::Migration
  def change
    rename_column :friends, :reciever, :receiver
  end
end