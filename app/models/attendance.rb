# frozen_string_literal: true
include ActionView::Helpers::UrlHelper
class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :member
  validates :attended, :rsvp, inclusion: [true, false]

  ransacker :full_name do
    Arel.sql("CONCAT_WS(' | ', members.fname, members.lname)")
  end 
  
  def attendance_mail(q)
    ar = ''
    q.each do |d|
      ar += Member.where(id: d.member_id).first.email
      ar += ','
    end
    mail_to(nil, 'Send Email to Group', { cc: ar, class: 'btn btn-outline-dark btn-sm' })
  end
end
