class AddTopicToConversations < ActiveRecord::Migration[6.0]
    def change
        add_reference :conversations, :topic, foreign_key: true
    end
end
