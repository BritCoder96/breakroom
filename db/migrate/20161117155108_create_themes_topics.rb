class CreateThemesTopics < ActiveRecord::Migration[5.0]
    def change
        create_table :themes_topics do |t|
            t.belongs_to :topic, index: true
            t.belongs_to :theme, index: true
        end
    end
end
