class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :topics

    def topics
       @themes = Theme.where(organization_id: [current_user&.organization_id, nil]).includes(:topics).load
    end
end
