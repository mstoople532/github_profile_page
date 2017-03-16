require "httparty"

class Github
  def user_info(username)
    HTTParty.get("https://api.github.com/users/#{username}")
  end

  def user_repos(username)
    HTTParty.get("https://api.github.com/users/#{username}/repos")
  end
end
