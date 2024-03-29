require 'elasticsearch/model'

class Message < ApplicationRecord
    belongs_to :user
    belongs_to :conversation
    validates :body, presence: true, length: {minimum: 2, maximum: 1000}
    after_create_commit { MessageBroadcastJob.perform_later(self) }

    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    document_type 'doc'
    
    def hours
        created_at.utc.in_time_zone("Eastern Time (US & Canada)").strftime('%l:%M %p')
    end

    def seconds
        created_at.utc.in_time_zone("Eastern Time (US & Canada)").strftime(':%S')
    end

    def mentioned?
        body.downcase.include?(user.nickname.downcase)
    end
end
