class AddColumnAlbum < ActiveRecord::Migration
  def up
  	add_column "albums", "uri", :string
  end
  def down
  	remove_column "albums", "uri"
  end
end
