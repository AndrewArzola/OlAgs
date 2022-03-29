# frozen_string_literal: true
include ActionView::Helpers::UrlHelper
class Member < ApplicationRecord
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
  
  def member_mail(q)
    ar = ''
    q.each do |d|
      ar += d.email
      ar += ','
    end
    mail_to(nil, 'Send Email to Group', { cc: ar, class: 'btn btn-outline-dark btn-sm' })
  end
end
