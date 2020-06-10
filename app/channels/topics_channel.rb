class TopicsChannel < ApplicationCable::Channel
    def subscribed
        stream_from "topics_#{params['topic_id']}_channel"
    end

    def unsubscribed
        # Any cleanup needed when channel is unsubscribed
 	end

    def send_message(data)
    	puts params
        current_user.messages.create!(body: data['message'], topic_id: data['topic_id'])
    end
end
