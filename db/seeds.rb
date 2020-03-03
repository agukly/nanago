Pram.create!(
  brand: "LuxStroller",
  model: "TI23",
  location: "Rue du Bla, 1234, Paris, France",
  year: 2019,
  description: "The best stroller ever for you to rent",
  price: 30,
  user_id: 1,
)


Booking.create!(
  start_day: DateTime.parse("09/01/2009 17:00"),
  end_day: DateTime.parse("10/02/2019 18:00"),
  total_price: 60,
  pram_id: 1,
  user_id: 1
)

Review.create!(
  score: 4,
  comment: "Was great!",
  booking_id: 1
)
