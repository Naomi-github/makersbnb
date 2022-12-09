require "booking_repository"
require 'booking'
require 'account_repository'
require 'account'

def reset_bookings_table
  seed_sql = File.read("spec/accounts_seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "makersbnb_test" })
  connection.exec(seed_sql)
end

describe BookingRepository do
    before(:each) do
      reset_bookings_table
    end

    it 'gets all bookings' do
      repo = BookingRepository.new
      bookings = repo.all

      expect(bookings[0].account_id).to eq '1'
      expect(bookings[0].listings_id).to eq '1'
      expect(bookings[0].date_booked).to eq "2022-09-12"
      expect(bookings[1].account_id).to eq '2'
      expect(bookings[1].listings_id).to eq '2'
      expect(bookings[1].date_booked).to eq "2022-06-07"
    end

    it 'returns a single booking' do
      repo = BookingRepository.new
      bookings = repo.find(1)

      expect(bookings.account_id).to eq '1'
      expect(bookings.listings_id).to eq '1'
      expect(bookings.date_booked).to eq "2022-09-12"
    end

  #   it 'updates a booking date' do

  #     newdate = '2023-01-01'

  #     repo = BookingRepository.new
  #     expect(repo.update(1, "2023-01-01")).to eq "Booking changed to 2023-01-01"
  #     bookings = repo.find(1)
  #     expect(bookings.date_booked).to eq "2023-01-01"
  # end
    #   repo = BookingRepository.new
    #   booking = Booking.new

    #   date = "2022-06-25"
    #   date_bookeds = date.to_date

    #   repo.update(1, :date_booked date_bookeds)
    #   bookings = repo.find(1)
    #   expect(bookings.date_booked).to eq "2022-06-25"

    #   # booking.account_id = 1
    #   # booking.listings_id = 2
    #   # booking.date_booked = "2022-12-12"
    #   # repo.create(booking)

    #   # bookings = repo.find[1]
    #   # expect(bookings.account_id).to eq 1
    #   # expect(bookings.listings_id).to eq 2
    #   # expect(bookings.date_booked).to eq '2022-12-12'
    # end

    # it "creates a new entry" do
    #   repo = BookingRepository.new
    #   booking = Booking.new

    #   booking.account_id = 3
    #   booking.listings_id = 2
    #   booking.date_booked = "2022-12-25"

    #   repo.create(booking)

    #   # bookings = repo.find(3)
    #   # expect(bookings.account_id).to eq '3'
    #   # expect(bookings.listings_id).to eq 3
    #   # expect(bookings.date_booked).to eq "2022-12-25"
    # end
end