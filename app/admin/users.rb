# encoding: utf-8
ActiveAdmin.register User do

  filter :email
  
  index do  
    column :id
    
    column("") { |user| link_to "Connect as", switch_to_admin_user_path(user), method: :post, target: "_blank"}
    
    column :email

    column t("last_connection") do |user|
      if user.last_sign_in_at.nil?
        "-"
      else
        user.last_sign_in_at.strftime("%Y-%m-%d")
      end
    end

    default_actions 
  end
  
  member_action :switch_to, method: :post do
    user = User.find(params[:id])
    
    sign_out :user if user_signed_in?

    sign_in :user, user
    redirect_to root_path
  end
  
end
