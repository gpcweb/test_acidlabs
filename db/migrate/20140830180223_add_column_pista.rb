class AddColumnPista < ActiveRecord::Migration
  def up
  	add_column "pista", "uri", :string
  	add_column "pista", "numero", :integer
  	add_column "pista", "popularidad", :decimal, :precision => 15, :scale => 2
  end
  def down
  	remove_column "pista", "uri"
  	remove_column "pista", "numero"
  	remove_column "pista", "popularidad"
  end
end
