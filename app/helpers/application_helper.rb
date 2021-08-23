module ApplicationHelper
  def github_url(author, repo) 
    link_to "https://github.com/#{author}/#{repo}", "https://github.com/#{author}/#{repo}"
  end
  def year_now
    Time.zone.now.year
  end
  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
