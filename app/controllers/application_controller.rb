require "hugging_face"
require "./app/services/hugging_face"

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?

  protected

  def configure_sign_up_params
    attributes = %i[username email password password password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end
end
