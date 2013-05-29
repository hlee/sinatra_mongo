require 'factory_girl'
require 'pry'
require 'mongoid'
require_relative '../factories'
include FactoryGirl::Syntax::Methods
#require File.expand_path '../../models', __FILE__
env = ENV['RACK_ENV'] || :development
Mongoid.load!("./mongoid.yml", env)
#Mongoid.load!(File.join(File.dirname(__FILE__), "config", "mongoid.yml"))
namespace :seeds do

  desc 'create admin user and team'
  task :prepare do
    create :user, :admin
    puts "seed from factorygirl"
  end
end