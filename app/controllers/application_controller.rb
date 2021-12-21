class ApplicationController < ActionController::Base

  # before_action :authenticate_customer!,except: [:top, :about]
  # before_action :authenticate_admin!,except: [:top, :about, :index]

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :encrypted_password, :nickname, :age, :gender])
  end

end
