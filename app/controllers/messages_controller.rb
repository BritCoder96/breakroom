class MessagesController < ApplicationController
    def show
        @message = Message.find(params[:id])
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to :back
    end
end
