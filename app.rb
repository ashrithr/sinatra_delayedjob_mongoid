require 'sinatra'
require 'sinatra/base'
require 'logger'
require 'mongo'
require 'mongoid'
require 'delayed_job'
require 'delayed_job_mongoid'
require_relative 'lib/simple_task'

Log = Logger.new(File.expand_path('../log/app.log', __FILE__))
# this is used by DJ to guess where tmp/pids is located (default)
RAILS_ROOT = File.expand_path('..', __FILE__)

# DelayedJob wants us to be on rails, so it looks for stuff
# in the rails namespace -- so we emulate it a bit
module Rails
  class << self
    attr_accessor :logger

    def root
      RAILS_ROOT
    end
  end
end
Rails.logger = Log

# Configure DelayedJob
Delayed::Worker.destroy_failed_jobs = false

class DelayedTest < Sinatra::Base
  configure do
    Mongoid.load!("config/mongoid.yml", :development)
  end

  get '/' do
    'test'
  end

  get '/index' do
    SimpleTask.new.doit
  end
end
