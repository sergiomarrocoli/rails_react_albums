class AlbumsService

  def initialize(api_service = ApiService.new)
    @api_service = api_service
  end

  def albums_hash_array(user_id = nil)
    Rails.cache.fetch("ulbums/user/#{user_id}", expires_in: 10.minutes) do
      all_albums(user_id).map do |album|
        user = @api_service.all_users.find {|user| user['id'] == album['userId'] }
        thumbnail = @api_service.all_photos.find {|photo| photo['albumId'] == album['id'] }
        album.merge("username" => user['name'], "thumbnail_url" => thumbnail['url'])
      end
    end
  end

  private

  def all_albums(user_id)
    albums = @api_service.all_albums
    user_id ? albums.select {|album| album['userId'] == user_id.to_i } : albums
  end
end