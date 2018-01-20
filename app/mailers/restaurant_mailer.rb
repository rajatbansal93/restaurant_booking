class RestaurantMailer < ApplicationMailer

  default from: 'notifications@restaurant.com'

  def notify_restaurant_new_reservation(restaurant, reservation)
    @restaurant = restaurant
    @reservation = reservation
    mail(to: restaurant.email, subject: 'Reservation Confirmed.')
  end

  def notify_restaurant_updated_reservation(restaurant, reservation)
    @restaurant = restaurant
    @reservation = reservation
    mail(to: restaurant.email, subject: 'Reservation Updated.')
  end

end
