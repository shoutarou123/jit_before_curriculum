class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  # deviseの処理を行う場合、configure_permitted_parametersを実行して

  private

    def configure_permitted_parameters
      if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
      end
    end
end
