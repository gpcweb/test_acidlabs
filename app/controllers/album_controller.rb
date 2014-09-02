class AlbumController < ApplicationController

	layout 'admin'

	def index
	   @albums = Album.order("anio DESC")
	end

	def show
		
	end

	def album_byartist
		@albums = Album.where("artista_id=#{params[:id]}").order("anio DESC")
	end
end
