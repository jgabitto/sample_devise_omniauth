class Api::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token, only: :github
    respond_to :json

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        p @user
        sign_in_and_redirect @user, event: :authentication

        # render json: @user
        # if @user.persisted?
        #     sign_in_and_redirect @user, event: :authentication
        # else

        # end
    end

end