require 'dotenv/load'

class LocationMapper
  API_KEY = ENV['GOOGLE_API_KEY']

  def location_hash(user)
    {
      "lat"=> user.dig('address', 'geo', 'lat'),
      "lng"=> user.dig('address', 'geo', 'lng'),
      "api_key"=> API_KEY
    }
  end
end