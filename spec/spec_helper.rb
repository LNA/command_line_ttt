require 'command_line_runner'
require 'mock_ui'
require 'rspec'
require 'ui'
require 'pry'
 
Dir["./lib/*.rb"].each { |file| require file }