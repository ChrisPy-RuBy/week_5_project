require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative('./controllers/albums_controller.rb')
require_relative('./controllers/artists_controller.rb')
require_relative('./controllers/genres_controller.rb')

get "/" do
  erb :index
end
