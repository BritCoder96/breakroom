class Theme < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :topics

    def to_s
        self.name
    end
end
