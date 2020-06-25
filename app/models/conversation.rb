class Conversation < ApplicationRecord
    belongs_to :user
    has_many :messages, dependent: :destroy
    belongs_to :topic

    validates :title, presence: true, length: {minimum: 2, maximum: 100}
    validates :topic_id, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 200}

    def timestamp
        created_at.strftime('%b %d at %I:%M %p')
    end
end
