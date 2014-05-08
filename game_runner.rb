$: << File.expand_path(File.dirname(__FILE__))
require 'ai'
require 'board'
require 'command_line_runner'
require 'ui'
require 'game_rules'

board = Board.new
game_rules = GameRules.new
ai = AI.new(game_rules)
ui = UI.new
command_line_runner = CommandLineRunner.new(ai, board, game_rules, ui)
command_line_runner.start_game