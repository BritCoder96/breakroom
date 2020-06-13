class CreateTopicsConversations < ActiveRecord::Migration[5.0]
    def change
        create_table :topics_conversations do |t|
            t.belongs_to :conversation, index: true
            t.belongs_to :topic, index: true
        end
    end
end
