class User < ApplicationRecord
    before_save :downcase_email
    has_many :creator_events, foreign_key: "creator_id", class_name: "Event"
    
    has_many :attendances, class_name: "Attendance",
                            foreign_key: :attendee_id,
                            dependent: :destroy

    has_many :attended_events, through: :attendances, source: :attended_event

    validates :username, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false} 

    def attend(event)
        attended_events.push event
    end
    
    def leave(event)
        attended_events.delete event
    end

    def attended_event?(event)
        attended_events.include? event
    end

    def creator_event?(event)
        creator_events.include? event
    end

    private
    def downcase_email
        self.email = email.downcase
    end

end
