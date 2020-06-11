class TopicsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_page, only: [:index]

QUESTIONS_PER_PAGE = 5
    def index
        @topics = Topic.all
        @themes = Theme.all.offset(QUESTIONS_PER_PAGE * @page).limit(QUESTIONS_PER_PAGE)
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
            flash[:success] = 'Chat room added!'
            redirect_to topics_path
        else
            flash.now[:error] = @topic.errors.map{|e,m|e.to_s.humanize.to_s + " " + m}
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
        @topic = Topic.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to root_path
    end

    private

    def topic_params
        params.require(:topic).permit(:title, :description, theme_ids: [])
    end

    def set_page
      @page = (params[:page] || 0).to_i
      puts  @page
    end
end
