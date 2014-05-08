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
    update_type_for_player("one")
    update_type_for_player("two")
    update_mark_for_player("one")
    update_mark_for_player("two")
  end

  def welcome_message
     @ui.welcome_user
  end

  def update_type_for_player(number)
    @player_one_type = @ui.gets_type_for(number) if number == "one"
    @player_two_type = @ui.gets_type_for(number) if number == "two"
  end

  def update_mark_for_player(number)
    @player_one_mark = @ui.gets_mark_for(number) if number == "one"
    @player_two_mark = @ui.gets_mark_for(number) if number == "two"
  end
end
