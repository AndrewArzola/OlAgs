# frozen_string_literal: true

class Member < ApplicationRecord
  include ActionView::Helpers::UrlHelper
  has_one :lineage, dependent: :destroy
  has_many :due, dependent: :destroy
  has_many :attendance, dependent: :destroy
  validates :fname, :lname, :email, :joinDate, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def full_name
    "#{fname} #{lname}"
  end

  ransacker :full_name do
    Arel.sql("CONCAT_WS(' ', members.fname, members.lname)")
  end

  def member_mail(search)
    emails = ''
    search.each do |d|
      emails += d.email
      emails += ','
    end
    mail_to(nil, 'Send Email to Group', { cc: emails, class: 'btn btn-outline-dark btn-sm' })
  end
end
