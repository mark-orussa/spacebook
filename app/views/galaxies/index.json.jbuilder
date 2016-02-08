json.array!(@galaxies) do |galaxy|
  json.extract! galaxy, :id, :author, :content, :image, :tag
  json.url galaxy_url(galaxy, format: :json)
end
