$: << File.expand_path(File.dirname(__FILE__))
require 'ai'
require 'board'
require 'lib/command_line_runner'
require 'lib/setup'
require 'game_rules'
require 'ui'

board    = Board.new
rules    = GameRules.new
ai       = AI.new(rules)
ui       = UI.new
setup    = Setup.new(ui)
settings = setup.get_game_options
command_line_runner = CommandLineRunner.new(ai, board.spaces, rules, ui)
command_line_runner.start_game_loop(settings, settings[:player_one_type], settings[:player_one_mark])
