class GitHubClient

  def initialize
    @client = Octokit::Client.new(access_token: Rails.application.credentials.fetch(:gist_token))
  end

  def create_gist(params)
    @client.create_gist(params)
  end
end