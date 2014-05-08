require 'command_line_runner'
require 'rspec'
require 'ui'
require 'pry'
 
Dir["./lib/*.rb"].each { |file| require file }