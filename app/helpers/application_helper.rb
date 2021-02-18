module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'Github', "http://github.com/#{author}/#{repo}"
  end
end
