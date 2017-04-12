class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    #before_action :authenticate_user!
private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name,:image])
    end
end
