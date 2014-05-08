$: << File.expand_path(File.dirname(__FILE__))
require 'ui'
require 'pry'

class Setup
  attr_accessor :player_one_type
  def initialize(ui, settings = {} )
    @player_one_type = settings[:player_one_type]
    @ui = ui
  end

  def get_game_options(settings = {})
    welcome_message
    settings[:player_one_type] = @ui.gets_type_for("one")
    settings[:player_two_type] = @ui.gets_type_for("two")
    settings[:player_one_mark] = @ui.gets_mark_for("one")
    settings[:player_two_mark] = @ui.gets_mark_for("two")
    settings
  end

  def welcome_message
     @ui.welcome_user
  end
end