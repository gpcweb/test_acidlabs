class CreateArtista < ActiveRecord::Migration
  def up
    create_table :artista do |t|
      t.string "nombre", :limit => 255
      t.decimal "popularidad", :precision => 15, :scale => 2
      t.timestamps
    end
  end
  def down
  	 drop_table :artista
  end
end
