class Restaurant < ApplicationRecord

  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  PHONE_REGEXP = /\d{3}-\d{3}-\d{4}/

  # Validations
  validates :name, :email, :phone, presence: true
  validates_format_of :email, with: EMAIL_REGEXP, allow_blank: true
  validates_format_of :phone, with: PHONE_REGEXP, allow_blank: true

  # Associations
  has_many :shifts, dependent: :destroy
end
