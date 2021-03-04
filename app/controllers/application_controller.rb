class ApplicationController < ActionController::API
    # include ActionController::RequestForgeryProtection
    # protect_from_forgery with: :null_session, prepend: true
    skip_before_action :verify_authenticity_token
end
