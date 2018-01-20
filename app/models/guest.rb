class Guest < ApplicationRecord

  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  #Associations
  has_many :reservations, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true, allow_blank: true, case_sensitive: false
  validates_format_of :email, with: EMAIL_REGEXP, allow_blank: true

end
