class Artista < ActiveRecord::Base
	has_many :album

	# Faltan las validaciones..
end
