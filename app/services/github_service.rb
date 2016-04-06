class GithubService
  include GithubRepos
  include GithubViews
  def initialize(user)
    @user = user
    @_connection = Faraday.new("https://api.github.com")
    connection.headers = {"Authorization" => "token #{@user.token}"}
  end

  def get(path)
    parse(connection.get(path, headers: @headers))
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    @_connection
  end
end
