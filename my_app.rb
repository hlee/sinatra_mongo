require 'sinatra'
require 'sinatra/json'
require 'mongoid'
require 'haml'
require 'ap'
require './models'
#require 'pry'

env = ENV['RACK_ENV'] || :development
Mongoid.load!(File.join(File.dirname(__FILE__), "config", "mongoid.yml"), env)

class MyApp < Sinatra::Base
  enable :sessions
  before do
    unless request.path_info == '/login'
      redirect '/login' if session[:auth].nil?
    end

    @auth = session[:auth]
  end

  get '/assets/:static_file' do
    redirect :static_file
  end

  # => To login page
  get '/login' do
    haml :login
  end

  # => Process login
  post '/login' do
    #binding.pry
    u = User.authenticate(params[:username], params[:password])
    if u
      session[:auth] = u
      redirect '/'
    else
      @msg = 'Auth failed'
      haml :login
    end
  end

  # => Process logout
  get '/logout' do
    session[:auth] = nil
    redirect '/login'
  end

  # => To /
  get '/' do
    haml :index
  end
end