class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :conversations, dependent: :destroy
    has_many :messages, dependent: :destroy
    belongs_to :organization

    validates_uniqueness_of :nickname
    validates :firstname, presence: true, length: {minimum: 2, maximum: 20}
    validates :lastname, presence: true, length: {minimum: 2, maximum: 20}
    validates :nickname, presence: true, length: {minimum: 2, maximum: 20}
    validates :email, presence: true, length: {minimum: 2, maximum: 40}

    def name
        "#{self.firstname} #{lastname}"
    end

    def is_admin?
        admin
    end

    def has_profile?
        profile.present?
    end
end
