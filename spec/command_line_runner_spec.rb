require 'spec_helper'
require 'ai'

describe CommandLineRunner do
  
  let (:game_rules) {GameRules.new}
  let (:ai)         {AI.new(game_rules)}
  let (:board)      {Board.new}
  let (:mock_ui)    {MockUI.new}
  let (:cl_runner)  {CommandLineRunner.new(ai, board, game_rules, mock_ui)}

  context '#start_game' do 
    it 'sends a welcome message' do 
      cl_runner.start_game

      mock_ui.showed_welcome_message.should == true
    end

    it 'asks the ui to provide the player types' do 
    end

    it 'asks the ui to provide the player marks' do 
    end

    it 'creates a human player with the correct mark' do 
    end

    it 'creates an ai player with the correct mark' do 
    end
  end
end