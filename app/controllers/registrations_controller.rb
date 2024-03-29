class RegistrationsController < Devise::RegistrationsController
    before_action :conversations

    def conversations
        @topics = Topic.where(organization_id: [current_user.organization_id, nil]).includes(:conversations).load
    end

    private

    def sign_up_params
        params.require(:user).permit(:nickname, :firstname, :lastname, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:nickname, :firstname, :lastname, :email, :password, :password_confirmation, :current_password)
    end
end
