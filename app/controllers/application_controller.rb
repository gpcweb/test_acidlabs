class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def confirm_service(r)
      # Confirma si la respuesta de Spotify es OK
  	  if r.code != 200
        # Si la respuesta no es OK entonces se redirige al search
  		  flash[:notice] = "Upss algo salio mal con Spotify."
        redirect_to(:controller => 'search', :action => 'index')
  		  return false
  	  else
        # Si no retorna el objeto nuevamente
  		  return r
  	  end

  end

  def get_artists(q)
     # Se envia la consulta a Spotify 
     r = HTTParty.get("http://ws.spotify.com/search/1/artist.json?q=#{q}")
     # Se confirma la respuesta
  	 artistas = confirm_service(r)
  	 return artistas
  end

  def get_albums(q)
     # Se envia la consulta a Spotify
     r = HTTParty.get("http://ws.spotify.com/lookup/1/.json?uri=#{q}&extras=albumdetail")
     # Se confirma la respuesta
  	 albums = confirm_service(r)
  	 return albums
  end

  def get_tracks(q)
     # Se envia la consulta a Spotify
     r = HTTParty.get("http://ws.spotify.com/lookup/1/.json?uri=#{q}&extras=trackdetail")
     # Se confirma la respuesta
  	 tracks = confirm_service(r)
  	 return tracks
  end

end