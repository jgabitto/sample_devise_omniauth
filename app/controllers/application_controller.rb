class ApplicationController < ActionController::API
    # include ActionController::RequestForgeryProtection
    # skip_before_action :verify_authenticity_token
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection

    protect_from_forgery with: :null_session, prepend: true
    # protect_from_forgery with: :exception
end
