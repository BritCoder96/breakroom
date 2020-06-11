class Topic < ApplicationRecord
    belongs_to :user
    has_many :messages, dependent: :destroy
    belongs_to :theme

    validates :title, presence: true, length: {minimum: 2, maximum: 20}
    validates :theme_id, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 50}
end
