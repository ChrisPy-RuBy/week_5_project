require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ( '../models/artist.rb')

get '/artists' do
  @artists = Artist.all()
  erb(:'artists/index') 
end

get '/artists/new' do
  erb(:'artists/new')
end

post '/artists' do 
  @artists = Artist.new( params )
  @artists.save()
  erb(:'artists/create')
end

get '/artists/:id/albums' do
  @artist = Artist.find(params[:id ]) #this is finding the artist based on the id passed to it! @artist is used as only one artist is passed to the variable
  @albums = @artist.album() #this calls the album method associated with the artist class and applies it to the current instance variable.
  erb(:'artists/albums/index')
end

get '/artists/:id/destroy' do
  Artist.destroy(params[:id])
  redirect to ('/artists')
end