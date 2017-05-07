require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')
require('pry-byebug')

Album.delete()
Artist.delete()
Genre.delete()


artist1 = Artist.new({
  'artist_name' => 'Elton John'
  })

artist2 = Artist.new({
  'artist_name' => 'Bon hiver'
  })

artist1.save()
artist2.save()


genre1 = Genre.new({
  'genre_name' => 'Pop'
  })

genre2 = Genre.new({
  'genre_name' => 'Rock'
  })

genre3 = Genre.new({
  'genre_name' => 'Metal'
  })

genre1.save()
genre2.save()
genre3.save()

album1 = Album.new({
  'title' => "Madman across the Water",
  'artist' => artist2.id,
  'genre' => genre1.id,
  'release_year' => 1971,
  'buy_price' => 3,
  'sell_price' => 9,
  'number_in_stock' => 2,
  'number_on_order' => 0
  })

album1.save()


binding.pry
nil