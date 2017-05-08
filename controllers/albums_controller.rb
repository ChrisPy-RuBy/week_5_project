require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')

get '/albums' do
  @albums = Album.all()
  erb(:'albums/index')
end

get '/albums/new' do
  @artists = Artist.all
  @genres = Genre.all
  erb(:'albums/new')
end

post '/albums' do
  @albums = Album.new( params )
  @albums.save()
  erb(:'albums/create')
end

get '/albums/:id' do
  @albums = Album.find(params[:id])
  erb(:'albums/show')
end

get '/albums/:id/edit' do 
  @albums = Album.find(params[:id])
  erb(:'albums/edit')
end

put '/albums/:id' do
  @albums = Album.new( params )
  @albums.update_ordering()
  erb(:'albums/update')
end 





