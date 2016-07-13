class Comentario < ActiveRecord::Base
  belongs_to :foro
  belongs_to :usuario
end
