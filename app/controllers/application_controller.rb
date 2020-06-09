class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :topics

    def topics
       @topics = Topic.all
       @themes = Theme.all
    end
end
