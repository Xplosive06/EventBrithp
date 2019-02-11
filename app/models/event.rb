class Event < ApplicationRecord

  after_create :event_send

  def event_send
    EventSendMailer.event_send.deliver_now
  end

  validates :start_date, presence: true
  validates :duration, presence: true
  validate :duration_multiple_of_5
  validates :title, presence: true, length: { minimum: 5, maximum: 140}
  #validates :description, presence: true, length: { minimum: 20, maximum: 1000}
  validates :price, presence: true
  validates :location, presence: true
  validate :price_range


  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :attendees, class_name: "User", through: :attendances

  def duration_multiple_of_5
    if self.duration % 5 != 0 || self.duration <= 0
      errors.add(:duration, "must be a positive multiple of 5")
    end
  end

  def price_range
    if self.price < 1 || price > 1000
      errors.add(:price, "must be between 1 and 1000")
    end
  end
end
