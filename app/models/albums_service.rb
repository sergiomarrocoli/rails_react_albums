class AlbumsService

  def initialize(api_service = ApiService.new)
    @api_service = api_service
  end

  def albums_hash_array
    @api_service.all_albums.map do |album|
      user = @api_service.all_users.find {|user| user['id'] == album['userId'] }
      thumbnail = @api_service.all_photos.find {|photo| photo['albumId'] == album['id'] }
      album.merge("username" => user['name'], "thumbnail_url" => thumbnail['url'])
    end
  end
end