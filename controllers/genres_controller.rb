require ( 'sinatra')
require ( 'sinatra/contrib/all' )
require ( 'pry-byebug' )
require_relative ( '../models/genre.rb')

get '/genres' do
  @genres = Genre.all()
  erb(:'genres/index')
end

get '/genres/new' do
    erb(:'genres/new')
end