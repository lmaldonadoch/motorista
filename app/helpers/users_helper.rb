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
      content_tag(:div, link_to("SIGN OUT", sign_out_path, class: 'text-secondary'), class: 'd-flex d-md-none align-items-center flex-nowrap text-secondary' )
    else
      content_tag(:div, link_to("SIGN IN", sign_in_path, class: 'text-secondary') + '｜' + link_to('REGISTER', new_user_path, class: 'text-secondary'), class: 'd-flex d-md-none align-items-center flex-nowrap' )
    end
  end
end
