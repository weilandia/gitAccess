class APIReposController < ApplicationController
  def index
    @repos = APIRepo.all
  end

  def show
    @repo = APIRepo.find(params[:name])
  end

private
  def repo_params
    params.permit(:name)
  end
end
