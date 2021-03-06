# frozen_string_literal: true

class Event < ApplicationRecord
  validates :creator_id, presence: true
  validates :title, presence: true
  # validates :location, presence: true
  validates :date, presence: true
  validates :description, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :attendances, class_name: 'Attendance',
                         foreign_key: :attended_event_id,
                         dependent: :destroy

  has_many :attendees, through: :attendances, source: :attendee

  scope :past, lambda {
                 where('date < ?', DateTime.current)
                   .order(date: :desc)
               }

  scope :upcoming, lambda {
                     where('date >= ?', DateTime.current)
                       .order(date: :asc)
                   }

  def attendee?(user)
    attendees.include? user
  end

  def upcoming?
    date&.future?
  end
end
