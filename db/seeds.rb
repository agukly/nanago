require 'faker'
require 'date'
require "open-uri"

puts "Started seed!"

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

def randomPramPic
  pram_array = [
    'https://www.target.com.au/medias/static_content/product/images/full/19/95/A1241995.jpg',
    'https://s.yimg.com/aah/albee-baby/milkbe-stroller-gold-4.jpg',
    'https://cdn.shopify.com/s/files/1/0039/7157/9974/products/PDP_Stroller_Black_001-S_850x.png',
    'https://www.kids-room.com/WebRoot/KidsroomDE/Shops/Kidsroom/5A17/038C/C00C/9424/04EE/4DEB/AE1C/2C4C/BILD3_05079564-105107/IC_IMAGE/en-chicco-double-stroller-strollin2-octane-2020-OCTANE.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71wSWg6%2BJ%2BL._SY355_.jpg',
    'https://babyzania.com/image/catalog/1/violi%20drive%20black.jpg',
    'https://img.orami.co.id/media/catalog/product/cache/1/image/730x/0dc2d03fe217f8c83829496872af24a0/s/t/stro-coco-039a-1-2_1.jpg',
    'https://image.smythstoys.com/original/desktop/165505.jpg'
  ]
  return pram_array.sample
end

def randomUserPic
  user_array = ['https://pmcdeadline2.files.wordpress.com/2019/12/donald-trump-1-e1577049942608.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Mateusz_Morawiecki_Prezes_Rady_Ministr%C3%B3w_%28cropped%29.jpg/220px-Mateusz_Morawiecki_Prezes_Rady_Ministr%C3%B3w_%28cropped%29.jpg',
    'https://media.tag24.de/951x634/4/b/4b674c5eeecf51f8c949.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/f/f2/Alain_Berset_2013.jpg',
    'https://media04.wochenblatt-reporter.de/article/2019/03/30/5/136975_L.jpg'
  ]
  return user_array.sample
end

5.times {
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
  )

  user.photo.attach(io: open(randomUserPic), filename: 'user.jpg', content_type: 'image/jpg')

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

  pram = Pram.create!(
  brand: randomStrollerData[0],
  model: randomStrollerData[1],
  location: randomStrollerData[6],
  year: randomStrollerData[2],
  description: randomStrollerData[3],
  price: randomStrollerData[4],
  user_id: randomStrollerData[5]
  )

  pram.photos.attach(io: open(randomPramPic), filename: 'pram.jpg', content_type: 'image/jpg')

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

puts "End of seed!"
