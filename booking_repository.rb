require_relative "booking"
require_relative 'account_repository'

class BookingRepository
    def all
        sql_query = "SELECT * FROM bookings"
        all_bookings = DatabaseConnection.exec_params(sql_query, [])

        bookings = []

        all_bookings.each do |eachbooking|
            booking = Booking.new
            booking.account_id = eachbooking["account_id"]
            booking.listings_id = eachbooking["listings_id"]
            booking.date_booked = eachbooking["date_booked"]
            bookings << booking
        end
        return bookings
    end

    def find(id)
        sql_query = "SELECT * FROM bookings WHERE id = $1"
        param = [id]
        result = DatabaseConnection.exec_params(sql_query, param)
        bookings = result[0]
        booking_return = Booking.new
        booking_return.account_id = bookings["account_id"]
        booking_return.listings_id = bookings["listings_id"]
        booking_return.date_booked = bookings["date_booked"]
        return booking_return
    end

    # def update(id, date_booked)
    #     sql_query = "UPDATE bookings SET date_booked = $1 WHERE booking_id = $2"
    #     params = [date_booked, id]
    #     newdate = 2023-01-01

    #     DatabaseConnection.exec_params(sql_query, params)
    #     return "Booking changed to #{newdate}"
    # end

    # def create(booking)
    #     sql_query = "INSERT INTO bookings (account_id, listings_id, date_booked) VALUES ($1,$2,$3)"
    #     param = [booking.account_id, booking.listings_id, booking.date_booked]
    #     DatabaseConnection.exec_params(sql_query, param)
    #   end
end