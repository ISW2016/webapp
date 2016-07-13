json.array!(@noticia) do |noticium|
  json.extract! noticium, :id, :titulo, :contenido
  json.url noticium_url(noticium, format: :json)
end
