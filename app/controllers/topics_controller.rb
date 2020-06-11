class TopicsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_page, only: [:index]
    QUESTIONS_PER_PAGE = 10

    def index
        @topics = Topic.all
        all_themes = Theme.where(organization_id: [current_user.organization_id, nil]).includes(:topics)
        @display_next = all_themes.count > QUESTIONS_PER_PAGE * (@page + 1)
        @theme_filters = all_themes.offset(QUESTIONS_PER_PAGE * @page).limit(QUESTIONS_PER_PAGE).load
    end

    def new
        @topic = Topic.new
    end

    def show
        @topic = Topic.includes(:messages).find_by(id: params[:id])
        @message = Message.new
        @topics = Topic.all
    end

    def create
        @topic = current_user.topics.build(topic_params) unless current_user.blank?
        if @topic.save
            flash[:notice] = 'Topic added!'
            redirect_to topics_path
        else
            flash.now[:error] = @topic.errors.map{|e,m|e.to_s.humanize.to_s + " " + m}
            respond_to do |format|
                format.js { render 'topics/create'}
            end
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
        @topic = Topic.find(params[:id]).destroy
        flash[:notice] = "Topic deleted"
        redirect_to root_path
    end

    private

    def topic_params
        params.require(:topic).permit(:title, :description, :theme_id)
    end

    def set_page
        @page = (params[:page] || 0).to_i
    end
end
