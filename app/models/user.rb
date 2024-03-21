class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 15 }
    validate :validate_username
    validates :email, presence: true, uniqueness: true, length: { minimum: 6, maximum: 254 },
    format: {
        with: URI::MailTo::EMAIL_REGEXP
    }

    validates :password, presence: true, length: { minimum: 8 },
    format: {
        with: /\A.*(?=.*\d)(?=.*[!@#$%^&*]).*\z/,
        message: 'must contain at least one number and one valid special character'
    }, on: :create
    validates :password_confirmation, presence: true, length: { minimum: 8 }, on: :create

    has_many :user_watch_titles
    has_many :watch_titles, through: :user_watch_titles

    has_many :watch_lists
    has_many :watch_list_followers
    has_many :watch_dates, through: :user_watch_titles

    def current_user_watch_titles
        self.user_watch_titles
    end

    private

    def validate_username
        unless username =~ /\A[a-zA-Z0-9_]+\z/
            errors.add(:username, 'can only contain letters, numbers and underscores and must include at least one letter or number')
        end
    end
end
