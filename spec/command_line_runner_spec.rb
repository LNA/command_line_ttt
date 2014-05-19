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
                            :player_one_mark=>"X",
                            :player_two_mark=>"O"} }

  let (:current_player) {settings[:player_one_type]}
  let (:current_mark)  {settings[:player_one_mark]  }

  context "#game_over" do
    it "checks for a game over" do
      runner.start_game_loop(settings, current_player, current_mark)
      mock_game_rules.checked_for_game_over.should == true
    end
  end

  context "#next_mark" do
    it "returns O when current mark is X" do
      runner.next_mark(current_mark, settings).should == "O"
    end
  end

  context "#make_human_move" do
    it "updates the board with a human move" do
      runner.make_human_move(settings, current_player, current_mark)
    end
  end
end
