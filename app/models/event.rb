# frozen_string_literal: true

class Event < ApplicationRecord
<<<<<<< HEAD
  has_many :attendance, dependent: :destroy
  has_many :due, dependent: :destroy
  validates :name, :description, :location, :start_time, :end_time, presence: true
  validate :start_greater_equal, :in_future
=======
    has_many :attendance, dependent: :destroy
    has_many :due, dependent: :destroy
    validates :name, :description, :location, :start_time, :end_time, presence: true
    validate :start_greater_equal
>>>>>>> f46c063 (Mail Buttons)

  def start_greater_equal
    if start_time == end_time || start_time > end_time
      errors.add(:start_time, 'must be before end time')
      errors.add(:end_time, 'must be after start time')
    elsif start_time.nil?
      errors.add('requires start time')
    elsif end_time.nil?
      errors.add('requires end time')
    end
  end

<<<<<<< HEAD
  def in_future
    if start_time.nil?
      errors.add('requires start time')
    elsif end_time.nil?
      errors.add('requires end time')
    elsif start_time < DateTime.current - 6.hours
      errors.add(:start_time, 'must not have already passed')
    elsif end_time < DateTime.current - 6.hours
      errors.add(:end_time, 'must not have already passed')
    end
  end
=======
    # def inFuture
    #     if start_time < DateTime.current-6.hours
    #         errors.add(:start_time, 'must not have already passed')
    #     end
    #     if end_time < DateTime.current-6.hours
    #         errors.add(:end_time, 'must not have already passed')
    #     end
    # end
>>>>>>> f46c063 (Mail Buttons)
end
