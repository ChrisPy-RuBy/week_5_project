require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')
require('pry-byebug')

Album.delete_all()
Artist.delete_all()
Genre.delete_all()


artist1 = Artist.new({
  'artist_name' => 'Elton John'
  })

artist2 = Artist.new({
  'artist_name' => 'Bon Iver'
  })

artist3 = Artist.new({
  'artist_name' => 'Lady Gaga'
  })

artist1.save()
artist2.save()
artist3.save()

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
  'artist' => artist1.id,
  'genre' => genre1.id,
  'release_year' => 1971,
  'buy_price' => 3,
  'sell_price' => 9,
  'number_in_stock' => 2,
  'number_on_order' => 0,
  'album_artwork' => "https://upload.wikimedia.org/wikipedia/en/d/d4/Elton_John_-_Madman_Across_the_Water.jpg"
  })

album2 = Album.new({
  'title' => "For Emma, Forever ago",
  'artist' => artist2.id,
  'genre' => genre2.id,
  'release_year' => 2007,
  'buy_price' => 3,
  'sell_price' => 9,
  'number_in_stock' => 5,
  'number_on_order' => 2,
  'album_artwork' => "https://upload.wikimedia.org/wikipedia/en/e/e0/Bon_iver_album_cover.jpg"
  })

album3 = Album.new({
  'title' => "Born this way",
  'artist' => artist3.id,
  'genre' => genre1.id,
  'release_year' => 2011,
  'buy_price' => 3,
  'sell_price' => 9,
  'number_in_stock' => 1,
  'number_on_order' => 20,
  'album_artwork' => "https://upload.wikimedia.org/wikipedia/en/c/c3/Born_This_Way_album_cover.png"
  })

album4 = Album.new({
  'title' => "Goodbye yellow brick road",
  'artist' => artist1.id,
  'genre' => genre1.id,
  'release_year' => 1973,
  'buy_price' => 3,
  'sell_price' => 9,
  'number_in_stock' => 0,
  'number_on_order' => 0,
  'album_artwork' => "https://upload.wikimedia.org/wikipedia/en/8/86/Elton_John_-_Goodbye_Yellow_Brick_Road.jpg"
  })


album1.save()
album2.save()
album3.save()
album4.save()

binding.pry
nil