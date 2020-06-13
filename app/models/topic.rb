class Topic < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :conversations

    def to_s
        self.name
    end
end
