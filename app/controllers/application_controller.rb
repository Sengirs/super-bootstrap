class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    if admin_user_signed_in?
      admin_users_path
    elsif user_signed_in?
      root_path
    end
  end
  
end
