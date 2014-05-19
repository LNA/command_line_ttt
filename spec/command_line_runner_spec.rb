require 'spec_helper'
require 'ai'

describe CommandLineRunner do

  let (:mock_game_rules) {MockGameRules.new}
  let (:ai)              {AI.new(mock_game_rules)}
  let (:board)           {Board.new}
  let (:mock_ui)         {MockUI.new}
  let (:runner)          {CommandLineRunner.new(ai, board, mock_game_rules, mock_ui)}
  let (:settings)        { {:player_one_type=>"H",
                            :player_two_type=>"A",
                            :player_one_mark=>"Q",
                            :player_two_mark=>"W"} }

  context '#start_game_loop' do
    it "receives the settings" do
      runner.start_game_loop(settings, settings[:player_one_type], settings[:player_two_type])
      runner.current_player.should == "H"
    end
  end
end
