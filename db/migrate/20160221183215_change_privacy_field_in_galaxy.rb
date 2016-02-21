class ChangePrivacyFieldInGalaxy < ActiveRecord::Migration
  def change
    rename_column :galaxies, :privacy, :privacy_id
  end
end
