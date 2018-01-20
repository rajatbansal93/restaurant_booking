class Reservation < ApplicationRecord

  # Validations
  validates :guest_count, :time, :table, :guest, :shift, presence: true
  validates :guest_count, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validate :future_time, if: [:time]
  validate :validate_time, if: [:time]
  validate :validate_guest_count, if: [:guest_count]

  # Associations
  belongs_to :table
  belongs_to :guest

  delegate :restaurant, to: :table

  private
    def validate_guest_count
      if guest_count > table.max_guest || guest_count < table.min_guest
        errors.add(:guest_count, "Invalid Guest Number!!")
      end
    end

    def future_time
      errors.add(:time, "Invalid Time!! Enter future time") if time < Time.current
    end

    def validate_time
      if time > time_of_reservation_day(:closing_time) || time < time_of_reservation_day(:opening_time)
        errors.add(:time, "Invalid Time!! Please enter time in between restaurant opening and closing time")
      end
    end

    def time_of_reservation_day(key)
      restaurant_timings[key] + ( time.beginning_of_day - restaurant_timings[key].beginning_of_day )
    end

    def restaurant_timings
      timings ||= restaurant.timings(shift)
    end
end
