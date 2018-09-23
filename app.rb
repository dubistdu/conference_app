
require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'

#  won't ba albe to create speaker record without requiring relative file - speaker
require_relative 'models/speaker'

class ConferenceApp < Sinatra::Base
  set :database_file, 'config/database.yml'

  get '/' do
    'It Works!'
  end

  get '/hello.json' do
    message = { success: true, message: 'hello'}
    json message
  end

  # Create a new endpoint to show the list of speakers, as JSON.
  get '/speakers' do
    @speakers = Speaker.all
    json @speakers
  end

end
