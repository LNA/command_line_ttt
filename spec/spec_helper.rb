require 'command_line_runner'
require 'mock_ui'
require 'mock_game_rules'
require 'rspec'
require 'setup'
require 'ui'
require 'pry'

Dir["./lib/*.rb"].each { |file| require file }
