class UserMapper

  def user_hash(user)
    {
      "name"=> user["name"],
      "username"=> user["username"],
      "email"=> user["email"],
      "address"=> address(user["address"]),
      "phone"=> user["phone"],
      "website"=> user["website"],
      "company_name"=> user.dig('company', 'name'),
      "catch_phrase"=> user.dig('company', 'catchPhrase'),
      "bs"=> user.dig('company', 'bs')
    }
  end

  def address(address)
    "#{ address["street"] }, #{ address["suite"]}, #{ address["city"] }. #{ address["zipcode"] }"
  end
end