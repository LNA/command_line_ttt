$: << File.expand_path(File.dirname(__FILE__))
require 'board'
require 'game_rules'
require 'ui'

class CommandLineRunner
  def initialize(ai, board, game_rules, ui)
    @ai = ai
    @board = board
    @game_rules = game_rules
    @ui = ui
  end

  def start_game_loop(settings, current_player, current_mark)
    play_game(settings, current_player, current_mark)
    ask_to_replay_game(settings, current_player, current_mark)
  end

# private
  def play_game(settings, current_player, current_mark)
    until game_over?
      display_board
      make_move(settings, current_player, current_mark)
      current_player = next_player(current_player, settings)
      current_mark   = next_mark(current_mark, settings)
    end
  end

  def next_mark(current_mark, settings)
    current_mark == settings[:player_one_mark] ? settings[:player_two_mark] : settings[:player_one_mark]
  end

  def make_move(settings, current_player, mark)
    make_human_move(settings, current_player, mark) if current_player == "H"
    make_ai_move(settings, current_player, mark)    if current_player == "A"
    check_for_winner if game_over?
    check_for_tie    if game_over?
  end

  def next_player(current_player, settings)
    current_player == settings[:player_one_type] ? settings[:player_two_type] : settings[:player_one_type]
  end

  def game_over?
    @game_rules.game_over?(@board)
  end

  def display_board
    @ui.display_grid(@board)
  end

  def make_human_move(settings, current_player, mark)
    unless game_over?
      @ui.ask_player_for_move
      @move = @ui.gets_move
      check_validity_of_move(settings, current_player, mark)
    end
  end

  def check_validity_of_move(settings, current_player, mark)
    if @game_rules.valid?(@board, @move) == false
      @ui.invalid_move_message
      make_move(settings, current_player, mark)
    else
      @board[@move.to_i] = mark
    end
  end

  def check_for_winner
    @ui.winner_message(@game_rules.winner(@board)) if @game_rules.winner(@board) != false
  end

  def check_for_tie
    @ui.tie_message if @game_rules.winner(@board) == false
  end

  def make_ai_move(settings, current_player, mark)
    opponent_mark = settings[:player_two_mark] if mark == settings[:player_one_mark]
    opponent_mark = settings[:player_one_mark] if mark == settings[:player_two_mark]
    best_move = @ai.find_best_move(@board, mark, opponent_mark)
    @board[best_move] = mark
  end

  def ask_to_replay_game(settings, current_player, current_mark)
    if @ui.ask_to_replay_game == "Y"
      replay(settings, current_player, current_mark)
    end
  end

  def replay(settings, current_player, current_mark)
    @board = [nil] * 9
    start_game_loop(settings, current_player, current_mark)
  end
end