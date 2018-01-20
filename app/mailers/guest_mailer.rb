class GuestMailer < ApplicationMailer

  default from: 'notifications@restaurant.com'

  def notify_reservation_confirmation(guest, reservation)
    @guest = guest
    @reservation = reservation
    mail(to: guest.email, subject: 'Reservation Confirmed.')
  end

  def notify_reservation_updation(guest, reservation)
    @guest = guest
    @reservation = reservation
    mail(to: guest.email, subject: 'Reservation Updated.')
  end

end
