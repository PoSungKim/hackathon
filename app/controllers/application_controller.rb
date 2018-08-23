class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :email, :password,:profileimage, :ages, :is_Brand, :etc, :phonenum, :registerimg ,:shop_name, :shop_num, :shop_info, allergy:[] ] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :email, :password,:profileimage, :ages, :is_Brand, :etc, :phonenum, :registerimg ,:shop_name, :shop_num, :shop_info, allergy:[] ])
  end

  #sessions공유
  # alias_method :devise_current_user, :current_user
  # def current_user
    # devise_current_user || current_owner
  # end

  def after_update_path_for(resource)
    redirect_to new_profile_path_url
  end

  # The path used after sign up.
 def after_sign_up_path_for(resource)
  redirect_to new_profile_path_url
  end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
    redirect_to new_profile_path_url
   end
end