require 'rake'

task :environment do
  require_relative 'app'
end

namespace :jobs do
  desc "Clear the delayed_job queue."
  task :clear => :environment do
    Delayed::Job.delete_all
  end

  desc 'delayed_job create indexes'
  task :create_indexes => :environment do
    Delayed::Backend::Mongoid::Job.create_indexes
  end

  desc 'delayed_job worker process'
  task :work => :environment do
    Delayed::Worker.new(:min_priority => ENV['MIN_PRIORITY'], :max_priority => ENV['MAX_PRIORITY']).start
  end
end
