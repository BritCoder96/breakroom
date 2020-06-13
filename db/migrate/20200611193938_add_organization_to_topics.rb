class AddOrganizationToTopics < ActiveRecord::Migration[6.0]
    def change
        add_reference :topics, :organization, foreign_key: true
    end
end
