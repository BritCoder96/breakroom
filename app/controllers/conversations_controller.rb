class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_page, only: [:index]
    TOPICS_PER_PAGE = 10

    def index
        @conversations_page = (params[:conversations_page] || 0).to_i
        @display_next = @all_topics.count > TOPICS_PER_PAGE * (@page + 1)
        @topic_filters = @all_topics.offset(TOPICS_PER_PAGE * @page).limit(TOPICS_PER_PAGE).load
        @conversations = Conversation.where(topic_id: session[:topic_ids]).paginate(page:params[:page],
        per_page: 5).order('created_at DESC')
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
            flash.now[:error] = @conversation.errors.map{|e,m|e.to_s.humanize.to_s + " " + m}
            respond_to do |format|
                format.js { render 'conversations/update'}
            end
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
        @page = (params[:topics_page] || 0).to_i
        @all_topics = Topic.where(organization_id: [current_user.organization_id, nil])
        topic_ids = @all_topics.map(&:id)
        topic_id = params[:topic_id].to_i
        if params[:topic_id].present?
            if params[:topic_id] == 'all'
                session[:topic_ids] = topic_ids
            elsif @all_topics.count == session[:topic_ids].count
                session[:topic_ids] = [topic_id]
            elsif session[:topic_ids].include?(topic_id)
                session[:topic_ids] = session[:topic_ids] - [topic_id]
            else
                session[:topic_ids] << topic_id
            end
        elsif session[:topic_ids].blank?
            session[:topic_ids] = topic_ids
        end
    end
end
