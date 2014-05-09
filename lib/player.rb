require 'scorecard'

class Player
  attr_reader :name, :scorecard

  def initialize(name)
    @name = name
    @scorecard = Scorecard.new
  end
end
