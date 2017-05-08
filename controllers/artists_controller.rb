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


# post '/artists/:id' do
#   @artists = Artist.new( params )
#   @pizza.update()
#   erb(:update)
# end


# post '/artists/:id/delete' do
#   @artists = Piz.find(params[:id])
#   @pizza.delete()
#   redirect '/pizzas'