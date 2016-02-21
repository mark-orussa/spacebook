class AddProfileColumnsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :age
      t.datetime :dob
      t.string :avatar
      t.string :comments
    end
  end
end
