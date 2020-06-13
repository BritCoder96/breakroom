class AddDescriptionToConversation < ActiveRecord::Migration[5.0]
    def change
        add_column :conversations, :description, :text
    end
end
