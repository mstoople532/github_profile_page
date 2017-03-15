require "sinatra"

get "/" do
  erb :"github_erb.html"
end

get "/github" do
  erb :"mock_github_style.html"
end
