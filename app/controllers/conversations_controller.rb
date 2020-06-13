class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_page, only: [:index]
    QUESTIONS_PER_PAGE = 10

    def index
        @conversations = Conversation.all
        all_topics = Topic.where(organization_id: [current_user.organization_id, nil]).includes(:conversations)
        @display_next = all_topics.count > QUESTIONS_PER_PAGE * (@page + 1)
        @topic_filters = all_topics.offset(QUESTIONS_PER_PAGE * @page).limit(QUESTIONS_PER_PAGE).load
    end

    def new
        @conversation = Conversation.new
    end

    def show
        @conversation = Conversation.includes(:messages).find_by(id: params[:id])
        @message = Message.new
        @conversations = Conversation.all
    end

    def create
        @conversation = current_user.conversations.build(conversation_params) unless current_user.blank?
        if @conversation.save
            flash[:notice] = 'Conversation added!'
            redirect_to conversations_path
        else
            flash.now[:error] = @conversation.errors.map{|e,m|e.to_s.humanize.to_s + " " + m}
            respond_to do |format|
                format.js { render 'conversations/create'}
            end
        end
    end

    def edit
        @conversation = Conversation.find(params[:id])
    end

    def update
        @conversation = Conversation.find(params[:id])

        if @conversation.update_attributes(conversation_params)
            redirect_to @conversation
        else
            render 'edit'
        end
    end

    def destroy
        @conversation = Conversation.find(params[:id]).destroy
        flash[:notice] = "Conversation deleted"
        redirect_to root_path
    end

    private

    def conversation_params
        params.require(:conversation).permit(:title, :description, :topic_id)
    end

    def set_page
        @page = (params[:page] || 0).to_i
    end
end
