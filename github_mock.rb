require "httparty"

class GithubMock
  def github_retrieval(input)
    HTTParty.get("https://api.github.com/users/#{input}/repos")
  end
end
