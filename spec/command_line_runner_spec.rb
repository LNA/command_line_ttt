require 'spec_helper'
require 'ai'

describe CommandLineRunner do
  
  let (:game_rules) {GameRules.new}
  let (:ai)         {AI.new(game_rules)}
  let (:board)      {Board.new}
  let (:mock_ui)    {MockUI.new}
  let (:cl_runner)  {CommandLineRunner.new(ai, board, game_rules, mock_ui)}
  let (:settings)   {"hi"}

  context '#start_game' do 
    
  end
end