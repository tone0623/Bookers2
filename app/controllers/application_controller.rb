class ApplicationController < ActionController::Base
  
  #ログイン,登録前に"configure_permitted_parameters"を実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected
  
  #sign_up時にnameのデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
