class AddUrlToConversations < ActiveRecord::Migration[6.0]
    def change
        add_column :conversations, :url, :string
    end
end
