module ApplicationHelper
  def display_session_path
    if user_signed_in?
      link_to 'サインアウト', destroy_user_session_path, method: :delete, class: 'button is-text'
    else
      link_to 'はじめる', login_path, class: 'button is-text'
    end
  end

  def default_meta_tags
    {
      site: '今日の積み上げ可視化サービス',
      title: 'Study Stash',
      reverse: true,
      charset: 'utf-8',
      description: '今日の積み上げを可視化しよう',
      keywords: %w[今日の積み上げ],
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.png') },
        # { href: image_url('apple_touch_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'en_US'
      },
      twitter: {
        card: 'summary_large_image',
        site: 'kenzoooooB'
      },
      index: true,
      noindex: !Rails.env.production?,
      viewport: 'width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0'
    }
  end
end
