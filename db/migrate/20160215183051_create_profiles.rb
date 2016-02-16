class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.datetime :dob
      t.string :email

      t.timestamps
    end
  end
end
