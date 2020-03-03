require 'faker'
require 'date'

def randomStrollerData
  brand = ["Hauck", "Chicco", "Thule", "ABC Design", "Mountain Buggy"].sample
  model = ["Citi Neo II (Caviar / Stone)", "Liteway 3 (Jet Black)", "Rapid 3R Trioset (Charcoal)", "Salsa 4 Air (Asphalt)", "Sleek + Bassinet (Navy Blue)"].sample
  year = rand(2014..2020)
  description = ["Works on every terrain", "is for parents with style (and money)", "is functional and stylish", "works for babies of all sizes"].sample
  price = rand(5..50)
  user_id = rand(1..5)

  return [brand, model, year, description, price, user_id]
end

def time_rand from = 0.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
end

def randomDate
  now = Date.today
  in_x_days = (now + rand(1..10))
  return in_x_days
end

5.times {
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
    )
}

20.times {
  Pram.create!(
  brand: randomStrollerData[0],
  model: randomStrollerData[1],
  location: Faker::Address.full_address,
  year: randomStrollerData[2],
  description: randomStrollerData[3],
  price: randomStrollerData[4],
  user_id: randomStrollerData[5]
  )
}

10.times {
  Booking.create!(
  start_day: Date.today,
  end_day: randomDate,
  total_price: 60,
  pram_id: rand(1..10),
  user_id: rand(1..5)
  )
}

10.times {
  Review.create!(
    score: 4,
    comment: randomStrollerData[3],
    booking_id: 1
  )
}
