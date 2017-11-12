# myapp.rb
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

get '/agent' do
    # use the views/agent.erb file
    erb :agent
  end