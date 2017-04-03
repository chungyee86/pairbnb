class ReservationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.Mailer.subject
  #
  # def mailer
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end

  # def booking_email(customer, host, reservation_id)

  # end

   default from: 'cyleong5011@gmail.com'

  def notification_email(customer, host, listing_id, reservation_id)
    @host = host
    @customer = customer
    @listing = Listing.find(listing_id)
    #once customer reserved a listing, it will send email to the listing host.
    byebug
    mail(to: @host.email, subject: "You have received a booking from #{@customer}").deliver

  end
end