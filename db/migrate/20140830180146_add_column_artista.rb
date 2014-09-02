class AddColumnArtista < ActiveRecord::Migration
  def up
  	add_column "artista", "uri", :string
  end
  def down
  	remove_column "artista", "uri"
  end
end
