$: << File.expand_path(File.dirname(__FILE__))
require 'ai'
require 'board'
require 'lib/command_line_runner'
require 'lib/setup'
require 'game_rules'
require 'ui'

board = Board.new
game_rules = GameRules.new
ai = AI.new(game_rules)
ui = UI.new
setup = Setup.new(ui)
game_options = setup.get_game_options
command_line_runner = CommandLineRunner.new(ai, board, game_iotionsm game_rules, ui)
command_line_runner.start_game(game_options)
