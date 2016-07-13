json.array!(@foros) do |foro|
  json.extract! foro, :id, :title, :content
  json.url foro_url(foro, format: :json)
end
