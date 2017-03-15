require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require "rack/test"
require "webmock/minitest"
require_relative "app"
require_relative "github_mock.rb"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def test_can_get_github_json
    stub_request(:get, "https://api.github.com/users/rposborne/repos")
      .to_return(body: File.read("./stub_requests/russells_repo.json"), headers: { "Content-Type" => "application/json" })
    russell = GithubMock.new
    assert_equal 1958311, russell.github_retrieval("rposborne")[0]["id"]
  end
end
