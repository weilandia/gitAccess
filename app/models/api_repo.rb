class APIRepo < OpenStruct
  attr_reader :views, :repo
  def initialize(repo, current_user)
    @views = APIView.all(current_user, repo[:name]).compact
    @repo = repo
  end

  def self.service(current_user)
    GithubService.new(current_user)
  end

  def self.all(current_user)
    service(current_user).repos.map do |repo|
      APIRepo.new(repo, current_user)
    end
  end

  def self.find(current_user, name)
    APIRepo.new(service(current_user).repo(name), current_user)
  end
end
