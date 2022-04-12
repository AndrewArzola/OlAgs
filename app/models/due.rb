# frozen_string_literal: true

class Due < ApplicationRecord
  include ActionView::Helpers::UrlHelper
  belongs_to :member
  belongs_to :event
  validates :dueAmount, presence: true
  validates :paid, inclusion: [true, false]

  def due_mail(search)
    emails = ''
    search.each do |d|
      emails += Member.where(id: d.member_id).first.email
      emails += ','
    end
    mail_to(nil, 'Send Due Group Email', { bcc: emails, subject: "Ol'Ags Dues Reminders", class: 'btn btn-outline-dark btn-sm' })
  end

  def paid_show(condtion)
    if condtion
      "\u2705"
    else
      "\u274C"
    end
  end

  ransacker :full_name do
    Arel.sql("CONCAT_WS(' | ', members.fname, members.lname)")
  end
end
