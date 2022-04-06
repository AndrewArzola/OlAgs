# frozen_string_literal: true

class Attendance < ApplicationRecord
  include ActionView::Helpers::UrlHelper
  belongs_to :event
  belongs_to :member
  validates :attended, :rsvp, inclusion: [true, false]

  ransacker :full_name do
    Arel.sql("CONCAT_WS(' | ', members.fname, members.lname)")
  end

  def attendance_mail(search)
    emails = ''
    search.each do |d|
      emails += Member.where(id: d.member_id).first.email
      emails += ','
    end
    mail_to(nil, 'Send Email to Group', { cc: emails, class: 'btn btn-outline-dark btn-sm' })
  end
end
