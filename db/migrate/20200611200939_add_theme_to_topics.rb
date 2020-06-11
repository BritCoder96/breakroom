class AddThemeToTopics < ActiveRecord::Migration[6.0]
    def change
        add_reference :topics, :theme, foreign_key: true
    end
end
