require "die"

describe Die do
  it "gives a random value between 1 and 6 when rolled" do
    roll = Die.roll
    [1,2,3,4,5,6].any? do |roll_possibility|
      roll == roll_possibility
    end.should == true
  end

  it "is truly random" do
    rolls = (0..100).map {|i| i = Die.roll}
    rolls.uniq.count.should_not == 1
  end
end
