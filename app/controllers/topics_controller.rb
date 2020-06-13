class TopicsController < ApplicationController
    before_action :authenticate_user!

    def index
        @topics = Topic.where(organization_id: [current_user.organization_id, nil]).includes(:conversations).load
    end

    def new
        @topic = Topic.new
    end

    def show
        @topic = Topic.find_by(id: params[:id])
        @topics = Topic.where(organization_id: [current_user.organization_id, nil]).includes(:conversations).load
    end

    def create
        @topic = Topic.new(topic_params)
        if @topic.save
            flash[:notice] = 'Topic added!'
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @topic = Topic.find(params[:id])
    end

    def update
        @topic = Topic.find(params[:id])

        if @topic.update_attributes(topic_params)
            redirect_to @topic
        else
          render 'edit'
        end
    end

    def destroy
        @topic = Topic.find(params[:id])
        @topic.conversations.destroy_all
        @topic.destroy
        flash[:notice] = "Topic deleted"
        redirect_to root_path
    end

    private

    def topic_params
        params.require(:topic).permit(:name, :organization_id)
    end
end
