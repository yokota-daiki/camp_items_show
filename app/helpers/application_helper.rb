module ApplicationHelper
  def page_title(page_title="")
    base_title = 'CAMPERs GEAR'
    page_title.empty? ? base_title : page_title + "|" + base_title
  end

  def active_if(path)
    path == controller_path ? 'active' : ''
  end

  def default_meta_tags
    {
      site: 'CAMPERs GEAR.',
      title: 'CAMPERs GEAR.',
      charaset: 'utf-8',
      description: 'キャンプの忘れ物を防ぐアイテム管理サービスです。自慢のキャンプギアやキャンプの思い出を記録できます。',
      keywords: 'CAMPERs GEAR,CAMP,CAMP GEAR,キャンプ,キャンプギア,キャンプ忘れ物,キャンプチェックリスト,キャンプ場',
      canonical: request.original_url,
      icon: [
        { href: image_url('tent.png') },
        { href: image_url('apple_touch_icon.png'), rel: 'apple_touch_icon', sizes: '180x180', type: 'image/png' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp_image1.jpg'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary'
      }
    }
  end
end
