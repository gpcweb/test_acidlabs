class CreatePista < ActiveRecord::Migration
  def up
    create_table :pista do |t|
      t.string "nombre", :limit => 255
      t.decimal "duracion", :precision => 15, :scale => 2
      t.integer "album_id"
      t.timestamps
    end
    add_index("pista", "album_id")
  end
  def down
  	drop_table :pista
  end
end
