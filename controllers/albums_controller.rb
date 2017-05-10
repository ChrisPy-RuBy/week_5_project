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
  @artists = Artist.all
  @genres = Genre.all
  erb(:'albums/edit')
end

get '/albums/:id/edit' do 
  @albums = Album.find(params[:id])
  @artists = Artist.all
  @genres = Genre.all
  erb(:'albums/edit')
end

get '/albums/:id/edit_stock' do 
  @albums = Album.find(params[:id])
  @artists = Artist.all
  @genres = Genre.all
  erb(:'albums/edit_stock')
end

post '/albums/:id' do
  @albums = Album.new( params )
  @albums.update()
  erb(:'albums/update')
end 

post '/albums/:id/destroy' do
  @album = Album.find(params[:id])
  @album.destroy()
  redirect to ('/albums')
end



