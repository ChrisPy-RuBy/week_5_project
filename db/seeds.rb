require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')
require('pry-byebug')

artist1 = Artist.new({
  'artist_name' => 'Elton John'
  })

genre1 = Genre.new({
  'genre_name' => 'Pop'
  })




binding.pry
nil