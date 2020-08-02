class ApiService
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com'

  def photos(album_id)
    Rails.cache.fetch("photos/#{album_id}", expires_in: 30.minutes) do
      self.class.get("/albums/#{album_id}/photos").as_json
    end
  end

  def user(user_id)
    Rails.cache.fetch("users/#{user_id}", expires_in: 1.hour) do
      self.class.get("/users/#{user_id}").as_json
    end
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