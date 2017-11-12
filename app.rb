# myapp.rb
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sprockets'
require 'uglifier'
require 'sass'
require 'execjs'

class MyApp < Sinatra::Base
  # initialize new sprockets environment
  set :environment, Sprockets::Environment.new

  # append assets paths
  environment.append_path "assets/stylesheets"
  environment.append_path "assets/javascripts"

  # compress assets
  environment.js_compressor  = :uglify
  environment.css_compressor = :scss

  # get assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  get "/views" do
    "erb :index"
  end  

  get '/agent' do
      # use the views/agent.erb file
      erb :agent
    end
end