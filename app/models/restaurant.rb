class Restaurant < ApplicationRecord

  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  PHONE_REGEXP = /\A[\d{3}]{3,8}\z/

  # Associations
  has_many :shifts, dependent: :destroy
  has_many :tables, dependent: :destroy

  # Validations
  validates :name, :email, :phone, presence: true
  validates_format_of :email, with: EMAIL_REGEXP, allow_blank: true
  validates_format_of :phone, with: PHONE_REGEXP, allow_blank: true
  validates :email, uniqueness: { case_sensitive: false }, allow_blank: true
  validates_associated :shifts
  validates_associated :tables

  accepts_nested_attributes_for :shifts
  accepts_nested_attributes_for :tables

  def timings(shift_name)
    shift = shifts.find_by_name(shift_name)
    shift.present? ? { opening_time: shift.opening_time, closing_time: shift.closing_time } : nil
  end
end
