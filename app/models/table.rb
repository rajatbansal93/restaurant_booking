class Table < ApplicationRecord

  # Validations
  validates :name, :min_guest, :max_guest, presence: true
  validates :min_guest, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :max_guest, numericality: { only_integer: true, greater_than: :min_guest }, allow_blank: true

  # Associations
  belongs_to :restaurant
end
