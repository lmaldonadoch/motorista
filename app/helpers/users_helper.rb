module UsersHelper
  def user_buttons(user)
    if user
      content_tag(:div, link_to("NEW ARTICLE", new_article_path, class: 'text-secondary') + '｜' + link_to("SIGN OUT", sign_out_path, class: 'text-secondary'), class: 'nav-item d-none d-md-flex align-items-center justify-content-end text-secondary' )
    else
      content_tag(:div, link_to("SIGN IN", sign_in_path, class: 'text-secondary') + '｜' + link_to('REGISTER', new_user_path, class: 'text-secondary'), class: 'nav-item d-none d-md-flex align-items-center justify-content-end' )
    end
  end

  def user_buttons_nav_small(user)
    if user
      content_tag(:div, link_to("NEW ARTICLE", new_article_path, class: 'user_links_nav') + link_to("SIGN OUT", sign_out_path), class: 'd-flex flex-column d-md-none align-items-start justify-content-between nav_div_links' )
    else
      content_tag(:div, link_to("SIGN IN", sign_in_path, class: 'user_links_nav') + link_to('REGISTER', new_user_path), class: 'd-flex flex-column d-md-none align-items-atart justify-content-between nav_div_links' )
    end
  end
end
