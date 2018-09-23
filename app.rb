
require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'

#  won't ba albe to create speaker record without requiring relative file - speaker
require_relative 'models/speaker'
require 'rack/contrib'

class ConferenceApp < Sinatra::Base
  set :database_file, 'config/database.yml'
  use Rack::PostBodyContentTypeParser

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
  
  post '/graphql' do
      result = ConferenceAppSchema.execute(
        params[:query],
        variables: params[:variables],
        context: { current_user: nil },
      )
      json result
    end
end
