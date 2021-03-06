class GithubApiService
  def get_data
    client_id     = "cdea9fa68ec51d9864b1"
    client_secret = "8fe7c7831ed8b379954300855900446b92d1bed4"
    code          = code_params[:code]
    response      = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
  end

  def get_token
    pairs = get_data.body.split("&")
    response_hash = {}
    pairs.each do |pair|
      key, value = pair.split("=")
      response_hash[key] = value
    end

    token = response_hash["access_token"]
  end

    # client_id     = "cdea9fa68ec51d9864b1"
    # client_secret = "8fe7c7831ed8b379954300855900446b92d1bed4"
    # code          = code_params[:code]
    # response      = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
    #
    # pairs = response.body.split("&")
    # response_hash = {}
    # pairs.each do |pair|
    #   key, value = pair.split("=")
    #   response_hash[key] = value
    # end
    #
    # token = response_hash["access_token"]
  def oauth
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")

    auth = JSON.parse(oauth_response.body)
  end
end
