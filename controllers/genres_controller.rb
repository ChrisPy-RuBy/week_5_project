require ( 'sinatra')
require ( 'sinatra/contrib/all' )
require ( 'pry-byebug' )
require_relative ( '../models/genre.rb')

get '/genres' do
  @genres = Genre.all.sort {|a1, a2| a1.genre_name <=> a2.genre_name}
  @albums = Album.all()
  erb(:'genres/index')
end

get '/genres/new' do
    erb(:'genres/new')
end

# this is the create method
post '/genres' do
    @genres = Genre.new(params)
    @genres.save()
    erb(:'genres/create')
end

#this method displays all the albums assocaited with specific genre on a seperate page.
get '/genres/:id/albums' do
  @genre = Genre.find(params[:id])
  @albums = @genre.album
  erb(:'genres/albums/index')
end

get '/genres/:id/destroy' do
  Genre.destroy(params[:id])
  redirect to '/genres'
end
