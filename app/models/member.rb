# frozen_string_literal: true

class Member < ApplicationRecord
  has_one :lineage, dependent: :destroy
  has_many :due, dependent: :destroy
  has_many :attendance, dependent: :destroy
  validates :fname, :lname, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def full_name
    "#{fname} #{lname}"
  end

  ransacker :full_name do
    Arel.sql("CONCAT_WS(' ', members.fname, members.lname)")
  end
end
