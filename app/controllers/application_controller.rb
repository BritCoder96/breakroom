class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :conversations

    def conversations
       @topics = Topic.where(organization_id: [current_user&.organization_id, nil]).includes(:conversations).load
    end
end
