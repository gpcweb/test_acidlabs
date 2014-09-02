class CreateAlbums < ActiveRecord::Migration
  def up
    create_table :albums do |t|
      t.string "nombre", :limit => 255
      t.integer "artista_id"
      t.timestamps
    end
    add_index("albums", "artista_id")
  end
  def down
  	drop_table :albums 
  end
end
