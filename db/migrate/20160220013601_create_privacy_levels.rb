class CreatePrivacyLevels < ActiveRecord::Migration
  def change
    create_table :privacy_levels do |t|
      t.string :display
      t.string :description

      t.timestamps
    end
  end
end
