class ChangeColumnGalaxies < ActiveRecord::Migration
  def change
    change_column :galaxies, :author, :integer

  end
end
