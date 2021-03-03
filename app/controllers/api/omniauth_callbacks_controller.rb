class Api::OmniauthCallbacksController < Devise::OmniauthCallbacksController
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