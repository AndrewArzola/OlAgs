# frozen_string_literal: true

class Lineage < ApplicationRecord
  include ActionView::Helpers::UrlHelper
  belongs_to :member
  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :member_id, uniqueness: { scope: :member_id }
  validates :father, uniqueness: { scope: :father }, unless: proc { |b| b.father.blank? }
  validates :son, uniqueness: { scope: :son }, unless: proc { |b| b.son.blank? }
  validate :check_equality
  # rubocop:enable Rails/UniqueValidationWithoutIndex

  ransacker :full_name do
    Arel.sql("CONCAT_WS(' | ', members.fname, members.lname)")
  end

  def check_equality
    errors.add(:son, ": Big and Little can't be the same") if father == son && (son.present? && father.present?)
    errors.add(:member_id, ": Little can't be the same as member id") if son == member_id
    errors.add(:member_id, ": Big can't be the same as member id") if father == member_id
  end

  # Function prints out name with link. father_son variable checks if input is father or son
  def name_check(attribute, father_son)
    if Member.exists?(id: attribute)
      link_to(Member.where(id: attribute).last.fname, Rails.application.routes.url_helpers.member_path(attribute))
    elsif father_son == 1
      'Head'
    else
      'Tail'
    end
  end
end
