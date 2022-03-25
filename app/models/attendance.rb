class Attendance < ApplicationRecord
    belongs_to :event 
    belongs_to :member 
    validates :attended, :rsvp, inclusion: [true, false]

    ransacker :full_name do
        Arel.sql("CONCAT_WS(' | ', members.fname, members.lname)")
      end
end
