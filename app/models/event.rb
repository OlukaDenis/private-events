class Event < ApplicationRecord
    validates :creator_id, presence: true
    validates :title, presence: true
    # validates :location, presence: true
    validates :date, presence: true

    belongs_to :creator, class_name: "User"

    has_many :attendances,  class_name: "Attendance", 
                            foreign_key: :attended_event_id, 
                            dependent: :destroy

    has_many :attendees, through: :attendances, source: :attendee
                            
end
