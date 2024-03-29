module Fixtures
  module ApiResponses
    def albums_response
      [
        {
          "userId"=>1,
          "id"=>1,
          "title"=>"quidem molestiae enim"
        }
      ]
    end
    
    def photos_response
      [
        {
          "albumId"=>1,
          "id"=>1,
          "title"=>"accusamus beatae ad facilis cum similique qui sunt",
          "url"=>"https://via.placeholder.com/600/92c952",
          "thumbnailUrl"=>"https://via.placeholder.com/150/92c952"
        }
      ]
    end

    def users_response
      [
        {
          "id"=>1,
          "name"=>"Leanne Graham",
          "username"=>"Bret",
          "email"=>"Sincere@april.biz",
          "address"=>{
            "street"=>"Kulas Light",
            "suite"=>"Apt. 556",
            "city"=>"Gwenborough",
            "zipcode"=>"92998-3874",
            "geo"=>{
              "lat"=>"-37.3159",
              "lng"=>"81.1496"
            }
          },
          "phone"=>"1-770-736-8031 x56442",
          "website"=>"hildegard.org",
          "company"=>{
            "name"=>"Romaguera-Crona",
            "catchPhrase"=>"Multi-layered client-server neural-net",
            "bs"=>"harness real-time e-markets"
          }
        }
      ]
    end

    def expected_array
      [
        {
          "userId"=>1,
          "id"=>1,
          "title"=>"quidem molestiae enim",
          "username"=>"Leanne Graham",
          "thumbnail_url"=>"https://via.placeholder.com/150/92c952"
        }
      ]
    end
  end
end