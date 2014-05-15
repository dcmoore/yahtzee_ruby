require 'player'
require 'yahtzee_rules'

class Game
  attr_reader :players, :turns_taken

  def initialize(ui)
    @ui = ui
    @turns_taken = 0
  end

  def run
    setup_players
    while !current_player.scorecard.full? do
      take_turn
    end
  end

  def setup_players
    num_players = @ui.get_num_players

    @players = []
    num_players.times do |number|
      @players << Player.new(@ui.get_player_name)
    end
  end

  def take_turn
    @turns_taken += 1
  end

  def current_player
    player_that_is_up = @turns_taken % @players.count
    @players[player_that_is_up]
  end
end
