$: << File.expand_path(File.dirname(__FILE__))
require 'ui'
class Setup
  def initialize(ui)
    @ui = ui
  end

  def get_game_options
    player_one      = player_type("one")
    player_two      = player_type("two")
    player_one_mark = gets_mark_for("one")
    player_two_mark = gets_mark_for("two")
  end

  def player_type(number)
    @ui.gets_type_for(number)
  end

  def gets_mark_for(player_number)
    @ui.gets_mark_for(player_number)
  end
end
