class Api::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    protect_from_forgery with: :null_session
    
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        p @user
        render json: @user
        # if @user.persisted?
        #     sign_in_and_redirect @user, event: :authentication
        # else

        # end
    end

end