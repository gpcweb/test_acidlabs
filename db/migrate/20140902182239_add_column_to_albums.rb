class AddColumnToAlbums < ActiveRecord::Migration
  def up
  	add_column "albums", "anio", :integer
  	add_column "albums", "avg_popularidad", :decimal, :precision => 15, :scale => 2
  end
  def down
  	remove_column "albums", "anio"
  	remove_column "albums", "avg_popularidad"
  end
end
