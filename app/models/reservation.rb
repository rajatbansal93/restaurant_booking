class Reservation < ApplicationRecord

  # Validations
  validates :guest_count, :time, :table, :guest, :shift, presence: true
  validates :guest_count, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validate :future_time, if: [:time]
  validate :validate_time, if: [:time]

  # Associations
  belongs_to :table
  belongs_to :guest

  delegate :restaurant, to: :table

  # private
    def future_time
      errors.add(:base, "Invalid Time!! Enter future time") if time < Time.nowr
    end

    def validate_time
      if time > time_of_reservation_day(:closing_time) || time < time_of_reservation_day(:opening_time)
        errors.add(:base, "Invalid Time!! Please enter time in between restaurant opening and closing time")
      end
    end

    def time_of_reservation_day(key)
      restaurant_timins[key] + ( time.beginning_of_day - restaurant_timins[key].beginning_of_day )
    end

    def restaurant_timins
      timings ||= restaurant.timings(shift)
    end
end
