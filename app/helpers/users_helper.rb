module UsersHelper
  def user_buttons(user)
    if user
      content_tag(:div, link_to("Sign out", sign_out_path, class: 'text-secondary'), class: 'd-none d-md-flex align-items-center justify-content-end w-100 text-secondary' )
    else
      content_tag(:div, link_to("Sign in", sign_in_path, class: 'text-secondary') + '｜' + link_to('Register', new_user_path, class: 'text-secondary'), class: 'd-none d-md-flex align-items-center justify-content-end w-100' )
    end
  end

  def user_buttons_nav_small(user)
    if user
      content_tag(:div, link_to("Sign out", sign_out_path, class: 'text-secondary'), class: 'd-flex d-md-none align-items-center flex-nowrap text-secondary' )
    else
      content_tag(:div, link_to("Sign in", sign_in_path, class: 'text-secondary') + '｜' + link_to('Register', new_user_path, class: 'text-secondary'), class: 'd-flex d-md-none align-items-center flex-nowrap' )
    end
  end
end
