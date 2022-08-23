module ApplicationHelper
  def page_title(page_titlea="", admin: false)
    base_title = 
      if admin
        '管理画面'
      else
        'CAMPERs'
      end
    page_title.empty? ? base_title : page_title + "|" + base_title
  end
end
