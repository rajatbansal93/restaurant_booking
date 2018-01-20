class Table < ApplicationRecord

  # Validations
  validates :name, presence: true
  validates :min_guest, numericality: { only_integer: true, greater_than: 0 }
  validates :max_guest, numericality: { only_integer: true, greater_than: :min_guest }

  # Associations
  belongs_to :restaurant
end
