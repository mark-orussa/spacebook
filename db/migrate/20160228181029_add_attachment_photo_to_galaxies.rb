class AddAttachmentPhotoToGalaxies < ActiveRecord::Migration
  def self.up
    change_table :galaxies do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :galaxies, :photo
  end
end
