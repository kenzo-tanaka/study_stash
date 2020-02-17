module ApplicationHelper
  def display_session_path
    if user_signed_in?
      link_to 'サインアウト', destroy_user_session_path, method: :delete, class: 'button is-text'
    else
      link_to 'はじめる', login_path, class: 'button is-text'
    end
  end
end
