class Scorecard
  POSSIBLE_ROLLS = [1,2,3,4,5,6].freeze

  def initialize
    @slots_and_their_scores = {}
  end

  def fill_slot(slot_name, rolls)
    @slots_and_their_scores[slot_name] = send(slot_name, rolls)
  end

  def total_score
    @slots_and_their_scores.inject(0) do |acc, (key, value)|
      acc += value
      acc
    end
  end

  def full?
    true
  end

  private

  def score_for_value_with_frequency(frequency, rolls)
    POSSIBLE_ROLLS.each do |possible_roll|
      number_of_occurrences = rolls.count {|roll| roll == possible_roll}
      return possible_roll * frequency if number_of_occurrences >= frequency
    end
    0
  end

  def any_number_with_frequency?(frequency, rolls)
    POSSIBLE_ROLLS.each do |possible_roll|
      number_of_occurrences = rolls.count {|roll| roll == possible_roll}
      return true if number_of_occurrences >= frequency
    end
    false
  end

  def three_of_a_kind(rolls)
    score_for_value_with_frequency(3, rolls)
  end

  def four_of_a_kind(rolls)
    score_for_value_with_frequency(4, rolls)
  end

  def full_house(rolls)
    any_number_with_frequency?(3, rolls) && rolls.uniq.count == 2 ? 25 : 0
  end
end

