class Shift < ApplicationRecord

  # Validations
  validates :name, :opening_time, :closing_time, presence: true
  validates :name, uniqueness: { scope: :restaurant }
  validate :closing_time_greater_than_opening_time, if: [:opening_time, :closing_time]

  # Associations
  belongs_to :restaurant

  private
    def closing_time_greater_than_opening_time
      if opening_time > closing_time
        errors.add(:base, "Invalid Closing Time!! Closing time should be grater than opening time.")
      end
    end
end
