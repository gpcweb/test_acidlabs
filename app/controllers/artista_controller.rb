class ArtistaController < ApplicationController

  layout 'admin'

  def index
    # Muestra todos los artistas en la base de datos
  	@artistas = Artista.all
  end

  def show
    # Muestra un artista en especifico de la base de datos
  	@artista = Artista.find(params[:id])
  end

  def new
    # Crea una instancia de la clase Artista segun los parametros enviados
    @artista = Artista.new(:nombre => params[:name], :popularidad => params[:popularity], :uri=> params[:href])
  end

  def create

    abArray = []
    # Se crea y guarda en la base de datos el artista 
  	artista = Artista.create(artista_params)
    # Para el artista se recuperan todos sus albums
    respuesta_albums = get_albums(artista.uri)
    artist_albums = respuesta_albums['artist']
    # Para cada uno de los registros recuperados se crea y se guarda el objeto en la base de datos segun el id del artista 
    artist_albums['albums'].each do |f|
      abArray << Album.create(:nombre => f['album']['name'], :artista_id => artista.id, :uri => f['album']['href'], :anio => f['album']['released']) 
    end
    
    abArray.each do |g|
    # Para cada album creado se recuperan las canciones asociadas a ese album  
      respuesta_pistas = get_tracks(g.uri)
      artist_tracks = respuesta_pistas['album']
          # Para cada uno de los registros recuperados (canciones) se crea y se guarda el objeto en la base de datos segun el id del album
          artist_tracks['tracks'].each do |e|
            pista = Pista.create(:nombre => e['name'], :duracion => e['length'], :album_id => g.id, :numero => e['track-number'], :popularidad => e['popularity'])
          end
    end

    redirect_to(:action => 'index')
  end

  def edit
  end

  private

    def artista_params
      params.require(:artista).permit(:nombre, :uri, :popularidad)
    end

    
end
