class GithubService
  attr_reader :connection
  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com")
    @connection.headers = {"User-Agent"=>"Faraday v0.9.2", "Authorization" => "token #{@user.token}"}
  end

  def repos
    parse(connection.get("/users/#{@user.nickname}/repos"))
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
