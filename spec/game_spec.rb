require 'game'

describe Game do
  before(:each) do
    @test_ui = double
    @test_ui.stub(:get_player_name)
    @test_ui.stub(:get_num_players).and_return(0)
  end

  it "asks how many players want to play" do
    game = Game.new(@test_ui)

    @test_ui.should_receive(:get_num_players).and_return(1)
    game.run
  end

  it "creates the correct number of players" do
    @test_ui.stub(:get_num_players).and_return(5)
    game = Game.new(@test_ui)

    game.run
    game.players.count.should == 5
  end

  it "each player should have a name" do
    @test_ui.stub(:get_num_players).and_return(3)
    @test_ui.should_receive(:get_player_name).and_return("Dave Moore", "Byron Woodfork", "Drew Templetron")
    game = Game.new(@test_ui)

    game.run
    game.players.first.name.should == "Dave Moore"
    game.players[1].name.should == "Byron Woodfork"
    game.players.last.name.should == "Drew Templetron"
    game.players.count.should == 3
  end

  context "taking turns" do
    it "takes turns until the game is over" do
      game = Game.new(@test_ui)
      mock_full_scorecard = double
      mock_full_scorecard.stub(:full?).and_return(true)
      player1 = Player.new("test guy")
      player2 = Player.new("other test guy")
      player1.stub(:scorecard).and_return(mock_full_scorecard)
      player2.stub(:scorecard).and_return(mock_full_scorecard)

      game.stub(:setup_players)
      game.instance_variable_set(:@players, [player1, player2])
      game.run
      game.turns_taken.should == 0
    end

    it "takes turns until the game is over" do
      game = Game.new(@test_ui)

      player1_scorecard = double
      player1_scorecard.stub(:full?).and_return(false, true)
      player2_scorecard = double
      player2_scorecard.stub(:full?).and_return(false, true)

      player1 = Player.new("test guy")
      player2 = Player.new("other test guy")
      player1.stub(:scorecard).and_return(player1_scorecard)
      player2.stub(:scorecard).and_return(player2_scorecard)

      game.stub(:setup_players)
      game.instance_variable_set(:@players, [player1, player2])
      game.run
      game.turns_taken.should == 2
    end
  end
end

