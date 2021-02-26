module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Github', "http://github.com/#{author}/#{repo}", target: :_blank
  end

  def flash_helper(key)
    content_tag :p, flash[key], class: "flash #{key}" if flash[key]
  end
end
