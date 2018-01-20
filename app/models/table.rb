class Table < ApplicationRecord

  # Validations
  validates :name, :min_gues, :max_guest, presence: true
  validates_format_of :email, with: EMAIL_REGEXP, allow_blank: true
  validates_format_of :phone, with: PHONE_REGEXP, allow_blank: true

  # Associations
  has_many :shifts, dependent: :destroy
end
