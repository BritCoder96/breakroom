class MessageBroadcastJob < ApplicationJob
    queue_as :default
    include EmojiHelper

    def perform(message)
        ActionCable.server.broadcast "conversations_#{message.conversation.id}_channel",
                                 message: render_message(message)
    end

    private

    def render_message(message)
        MessagesController.render partial: 'messages/message', locals: {message: message}
    end
end
