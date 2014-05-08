$: << File.expand_path(File.dirname(__FILE__))
require 'board'
require 'game_rules'
require 'ui'

class CommandLineRunner
  def initialize(ai, board, game_options, game_rules, ui)
    @ai = ai
    @board = board
    @game_options = game_options
    @game_rules = game_rules
    @ui = ui
  end

  def start_game(settings)
    display_board
    current_player = settings[:player_one_type]
    current_mark   = settings[:player_one_mark]
    until game_over?
      play_game(settings, current_player, current_mark)
    end
    display_board
  end

private
  def play_game(settings, current_player, current_mark)
    until game_over?
      make_move(settings, current_player, current_mark)
      display_board
      make_move(settings, next_player(current_player, settings), next_mark(current_mark, settings))
      display_board
    end
  end

  def next_mark(current_mark, settings)
    mark = settings[:player_one_mark] ? settings[:player_two_mark] : settings[:player_one_mark]
  end

  def make_move(settings, current_player, mark)
    unless game_over?
      make_human_move(settings, current_player, mark) if current_player == "H"
      make_ai_move(settings)    if current_player == "A"
      check_for_winner if game_over?
      check_for_tie    if game_over?
    end
  end

  def next_player(current_player, settings)
    current_player == settings[:player_one_type] ? settings[:player_two_type] : settings[:player_one_type]
  end
  
  def player_type(number)
    @ui.gets_type_for(number)
  end

  def gets_mark_for(player_number)
    @ui.gets_mark_for(player_number)
  end

  def welcome_message
    @ui.welcome_user
  end

  def game_over?
    @game_rules.game_over?(@board.spaces)
  end

  def display_board
    @ui.display_grid(@board.spaces)
  end

  def make_human_move(settings, current_player, mark)
    unless game_over?
      @ui.ask_player_for_move
      @move = @ui.gets_move
      check_validity_of_move(settings, current_player, mark)
    end
  end

  def check_validity_of_move(settings, current_player, mark)
    if @game_rules.valid?(@move, @board) == false
      @ui.invalid_move_message
      make_move(settings, current_player, mark)
    else
      @board.fill(@move, mark)
    end
  end

  def check_for_winner
    @ui.winner_message(@game_rules.winner(@board.spaces)) if @game_rules.winner(@board.spaces) != false
  end

  def check_for_tie
    @ui.tie_message if @game_rules.winner(@board.spaces) == false
  end

  def make_ai_move(settings)
    mark = settings[:player_one_type] if current_player = settings[:player_one_type] 
    mark = settings[:player_two_mark] if current_player = settings[:player_two_type] 
    opponent_mark = settings[:player_one_mark] if settings[:player_two_mark] == mark
    opponent_mark = settings[:player_two_mark] if settings[:player_one_mark] == mark
    @move = @ai.find_best_move(@board, mark, opponent_mark)
    @board.fill(@move, mark)
  end

  def respond_to_invalid_move
    @ui.invalid_move_message
    play_game
  end
end 