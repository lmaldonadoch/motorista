module UsersHelper
  def user_buttons(user)
    # rubocop:disable Layout/LineLength
    if user
      content_tag(:div, link_to('NEW ARTICLE', new_article_path, class: 'text-secondary') + '｜' + link_to('SIGN OUT', sign_out_path, class: 'text-secondary') + '｜' + link_to('PROFILE', user_path(User.find(current_user.id)), class: 'text-secondary'), class: 'nav-item d-none d-lg-flex align-items-center justify-content-end text-secondary')
    else
      content_tag(:div, link_to('SIGN IN', sign_in_path, class: 'text-secondary') + '｜' + link_to('REGISTER', new_user_path, class: 'text-secondary'), class: 'nav-item d-none d-lg-flex align-items-center justify-content-end')
    end
  end

  def user_buttons_nav_small(user)
    if user
      content_tag(:div, link_to('NEW ARTICLE', new_article_path, class: 'user_links_nav') + link_to('SIGN OUT', sign_out_path) + link_to('PROFILE', user_path(User.find(current_user.id))), class: 'd-flex flex-column d-lg-none align-items-start justify-content-between nav_div_links')
    else
      content_tag(:div, link_to('SIGN IN', sign_in_path, class: 'user_links_nav') + link_to('REGISTER', new_user_path), class: 'd-flex flex-column d-lg-none align-items-atart justify-content-between nav_div_links')
    end
  end

  def most_voted_article(user)
    articles = user.articles
    most_voted = articles[0]
    articles.each do |article|
      most_voted = article if most_voted.number_of_votes < article.number_of_votes
    end

    most_voted
  end

  def users_articles(most_voted_article, user)
    user.articles.reject { |article| article == most_voted_article }
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
# rubocop:enable Layout/LineLength
