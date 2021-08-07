module ApplicationHelper
  def github_url(author, repo) 
    link_to "https://github.com/#{author}/#{repo}", "https://github.com/#{author}/#{repo}"
  end
  def year_now
    Time.zone.now.year
  end
end
