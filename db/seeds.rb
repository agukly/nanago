require 'faker'
require 'date'

Review.destroy_all
Booking.destroy_all
Pram.destroy_all
Message.destroy_all
Conversation.destroy_all
User.destroy_all

def randomStrollerData
  brand = ["Hauck", "Chicco", "Thule", "ABC Design", "Mountain Buggy"].sample
  model = ["Citi Neo II (Caviar / Stone)", "Liteway 3 (Jet Black)", "Rapid 3R Trioset (Charcoal)", "Salsa 4 Air (Asphalt)", "Sleek + Bassinet (Navy Blue)"].sample
  year = rand(2014..2020)
  description = ["Works on every terrain", "is for parents with style (and money)", "is functional and stylish", "works for babies of all sizes"].sample
  price = rand(5..50)
  user_id = rand(User.first.id..User.last.id)
  location = ["Lüdorf 17 42929 Wermelskirchen", "35 Rue du Chevalier de la Barre 75018 Paris", "R. Me. Deus 4 1900-312 Lisboa", "Carrer de Mallorca 401 08013 Barcelona", "aleja Unii Lubelskiej 4 94-208 Łódź", "Falkenstrasse 1 8008 Zürich", "Mönchsberg 34 5020 Salzburg", "Platzl 9 80331 München", "10 Wardour St, West End London W1D 6BZ", "Union Hall Pl Londonderry BT48 6LU", "Galärvarvsvägen 14 115 21 Stockholm", "Slovanský ostrov 226 110 00 Praha 1", "Dijver 12, 8000 Brugge", "Plaça de Santa Úrsula 1 46003 València", "Binningerstrasse 40 4054 Basel", "Galileo Galilei Galileistraße 21 39012 Meran"].sample

  return [brand, model, year, description, price, user_id, location]
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

1.times { Conversation.create!(
  sender_id: User.all.sample.id,
  recipient_id: User.all.sample.id
)
}

3.times { Message.create!(
    body: "I wanted to let you know bliblablu",
    conversation_id: Conversation.all.sample.id,
    user_id: User.all.sample.id
  )
}

20.times {
  Pram.create!(
  brand: randomStrollerData[0],
  model: randomStrollerData[1],
  location: randomStrollerData[6],
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
  pram_id: rand(Pram.first.id..Pram.last.id),
  user_id: rand(User.first.id..User.last.id)
  )
}

10.times {
  Booking.create!(
  start_day: Date.today-1.day,
  end_day: Date.today-5.day,
  total_price: 60,
  pram_id: rand(Pram.first.id..Pram.last.id),
  user_id: rand(User.first.id..User.last.id)
  )
}

10.times {
  Review.create!(
    score: 4,
    comment: randomStrollerData[3],
    booking_id: Booking.all.sample.id
  )
}
