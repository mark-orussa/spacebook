class AddFirstAndLastNamesToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :fName
      t.string :lName
    end
  end
end
