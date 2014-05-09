require "player"

describe Player do
  it "has a name" do
    player1 = Player.new("Dave")
    player1.name.should == "Dave"
  end

  it "has a scorecard" do
    player2 = Player.new("Drew")
    player2.scorecard.class.should == Scorecard
  end

  it "has a unique scorecard that belongs to it" do
    player1 = Player.new("Dave")
    player2 = Player.new("Drew")

    player1.scorecard.object_id.should_not == player2.scorecard.object_id
    player1.scorecard.object_id.should == player1.scorecard.object_id
  end
end
