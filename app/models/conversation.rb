class Conversation < ApplicationRecord
    belongs_to :user
    has_many :messages, dependent: :destroy
    belongs_to :topic

    validates :title, presence: true, length: {minimum: 2, maximum: 20}
    validates :topic_id, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 50}

    self.(PER_PAGE = 5)
    def timestamp
        created_at.strftime('%d %B %Y %H:%M:%S')
    end
end
