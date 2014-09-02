class SearchController < ApplicationController

  layout 'admin'
  
  # Antes de que cualquier accion se ejecute confirmar si el servicio esta disponible, excepto cuando cargamos el index
  before_action :confirm_service, :except => [:index]

  def index
  	
  end

  def goto_spotify
      # Si el usuario digito algo  entonces se busca el artista
      if params[:q].present?
        @artistas = get_artists(params[:q])
      else
      # Si el usuario no digito nada entonces se redirige al index con un mensaje  
      	redirect_to(:action => 'index')
        flash[:notice] = "Por favor buscar algo valido."
      end

  end

   def show_albums
    # Busca los albums segun el artista
    response = get_albums(params[:uri])
    @artist_albums = response['artist']
  end

  def show_album_tracks
    # Busca las canciones segun el album
    reponse = get_tracks(params[:uri])
    @albums_tracks = reponse['album']
  end
end
