require 'spec_helper'
require 'ui'

describe Setup do
  
  let (:game_rules) {GameRules.new}
  let (:ai)         {AI.new(game_rules)}
  let (:board)      {Board.new}
  let (:mock_ui)    {MockUI.new}
  let (:setup)  {Setup.new(mock_ui, settings = {})}

  context '#get_game_options' do 
    it 'sends a welcome message' do 
      setup.get_game_options(settings = {})

      mock_ui.showed_welcome_message.should == true
    end

    it 'asks the ui to provide the player types' do 
      setup.get_game_options(settings = {})

      mock_ui.got_player_type.should == true
    end

    it 'asks the ui to provide the player marks' do 
      setup.get_game_options(settings = {})

      mock_ui.got_mark_for.should == true
    end

    it 'creates a player with the correct mark' do 
      setup.get_game_options(settings = {})

      settings[:player_one_mark].should == true
    end
  end
end