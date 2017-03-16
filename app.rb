require "sinatra"
require_relative "github"

get "/" do
  erb :"github_erb.html"
end

post "/github" do
  user = params["username"]
  @repos = Github.new.user_repos(user)
  @info = Github.new.user_info(user)
  erb :"mock_github_style.html"
end
