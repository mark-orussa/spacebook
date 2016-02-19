class AddPrivacyToGalaxy < ActiveRecord::Migration
  def change
    add_column :galaxies, :privacy, :integer
  end
end
