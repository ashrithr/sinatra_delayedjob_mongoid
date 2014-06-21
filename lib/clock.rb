require 'clockwork'
include Clockwork

require_relative '../app'

every(10.seconds, 'Queueing interval job') { SimpleTask.new.doit_in_5secs }
