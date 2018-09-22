require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'

class ConferenceApp < Sinatra::Base
  set :database_file, 'config/databse.yml'

  get '/' do
    'It Works!'	    'It Works!'

  get '/hello.json' do
    message = { success: true, message: 'hello' }
    json message
  end
end
