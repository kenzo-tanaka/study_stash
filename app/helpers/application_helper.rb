module ApplicationHelper

  def display_session_path
    if user_signed_in?
      link_to 'サインアウト', destroy_user_session_path, method: :delete, class: 'button'
    else
      link_to 'はじめる', login_path, class: 'button is-success'
    end
  end

  def display_user_icon(user, size: '40x40', style: '')
    link_to user_path(user) do
      if user.icon.present?
        image_tag user.icon, size: size, class: 'user-icon', style: style
      else
        image_tag 'user_default_icon', size: size, class: 'user-icon', style: style
      end
    end
  end

  def is_yours(instance)
    user_signed_in? && instance.user == current_user
  end

  def default_meta_tags
    {
      site:  Settings.service.concept,
      title: 'Study Stash',
      reverse: true,
      charset: 'utf-8',
      description:  Settings.service.concept,
      keywords: %w[今日の積み上げ ポートフォリオ],
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.png') },
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

  require 'redcarpet'
  require 'coderay'

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language.split(':')[0]
      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'yml'
        lang = 'yaml'
      when 'css'
        lang = 'css'
      when 'html'
        lang = 'html'
      when ''
        lang = 'md'
      else
        lang = language
      end
      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end
end
