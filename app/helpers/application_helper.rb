module ApplicationHelper
  def page_title(page_title="")
    base_title = 'CAMPERs'
    page_title.empty? ? base_title : page_title + "|" + base_title
  end

  def active_if(path)
    path == controller_path ? 'active' : ''
  end
end
