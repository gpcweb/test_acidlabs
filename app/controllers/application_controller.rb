class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def confirm_service
  	# Pregunto por cualquier cosa la idea es verificar si el servicio esta disponible
  	  response = HTTParty.get("http://ws.spotify.com/search/1/artist?q=lorde")
  	  if response.code != 200
  		flash[:notice] = "Upss algo salio mal."
        redirect_to(:controller => 'search', :action => 'index')
  		return false
  	  else
  		return true
  	  end
  end

  # Estos metodos pueden incluir algunas validaciones o mensajes personalizados 
  # dependiendo del mensaje de respuesta (200, 500, 503, 403, 404, etc)
  def get_artists(q)
  	 artistas = HTTParty.get("http://ws.spotify.com/search/1/artist.json?q=#{q}")
  	 return artistas
  end

  def get_albums(q)
  	 albums = HTTParty.get("http://ws.spotify.com/lookup/1/.json?uri=#{q}&extras=albumdetail")
  	 return albums
  end

  def get_tracks(q)
  	 tracks = HTTParty.get("http://ws.spotify.com/lookup/1/.json?uri=#{q}&extras=trackdetail")
  	 return tracks
  end

end