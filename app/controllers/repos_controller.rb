class ReposController < ApplicationController
  def index
    github = Github.new
    repos = github.repos.list user: params[:user]
    if params[:search].present?
      search_repos = []
      repos.each do |repo|
        search_repos << repo if repo.name.include?(params[:search])
      end
      repos = search_repos
    end
    render json: repos
  end
end
