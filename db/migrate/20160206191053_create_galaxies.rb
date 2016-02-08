class CreateGalaxies < ActiveRecord::Migration
  def change
    create_table :galaxies do |t|
      t.string :author
      t.text :content
      t.string :image
      t.string :tag

      t.timestamps
    end
  end
end
