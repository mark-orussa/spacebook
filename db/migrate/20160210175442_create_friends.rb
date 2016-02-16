class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :sender
      t.string :reciever
      t.boolean :friends

      t.timestamps
    end
  end
end
