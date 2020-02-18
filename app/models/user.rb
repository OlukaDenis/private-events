class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id", class_name: "Event"
    before_save :downcase_email
    validates :username, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false} 
    private
    def downcase_email
        self.email = email.downcase
    end

end
