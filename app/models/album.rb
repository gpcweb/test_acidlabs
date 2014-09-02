class Album < ActiveRecord::Base
	belongs_to :artista
    has_many :pistas 
	# Faltan las validaciones..
end
