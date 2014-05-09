require 'scorecard'

describe Scorecard do
  before(:each) do
    @scorecard = Scorecard.new
  end

  it "fills a slot with rolls and scores them" do
    @scorecard.fill_slot(:three_of_a_kind, [1,1,1,3,6])
    @scorecard.total_score.should == 3
  end

  context "three_of_a_kind" do
    it "multiplies the number that occurs 3 times" do
      @scorecard.fill_slot(:three_of_a_kind, [2,2,2,3,6])
      @scorecard.total_score.should == 6
    end

    it "multiplies the number that occurs more than 3 times by 3" do
      @scorecard.fill_slot(:three_of_a_kind, [2,2,2,2,2])
      @scorecard.total_score.should == 6
    end

    it "is worth 0 points if there aren't any numbers that occur at least 3 times" do
      @scorecard.fill_slot(:three_of_a_kind, [1,2,3,4,5])
      @scorecard.total_score.should == 0
    end
  end

  context "four_of_a_kind" do
    it "multiplies the number that occurs 4 times" do
      @scorecard.fill_slot(:four_of_a_kind, [1,1,1,1,4])
      @scorecard.total_score.should == 4
    end

    it "multiplies the number that occurs more than 4 times by 4" do
      @scorecard.fill_slot(:four_of_a_kind, [2,2,2,2,2])
      @scorecard.total_score.should == 8
    end

    it "is worth 0 points if there aren't any numbers that occur at least 4 times" do
      @scorecard.fill_slot(:four_of_a_kind, [1,2,3,4,5])
      @scorecard.total_score.should == 0
    end
  end
end
