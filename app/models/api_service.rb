class ApiService
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com'

  def photos(album_id)
    self.class.get("/albums/#{album_id}/photos")
  end

  def all_albums
    @_albums ||= self.class.get('/albums')
  end

  def all_users
    @_users ||= self.class.get('/users')
  end

  def all_photos
    @_photos ||= self.class.get('/photos')
  end
end