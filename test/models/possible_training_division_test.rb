require 'test_helper'

class PossibleTrainingDivisionTest < ActiveSupport::TestCase
  def setup
    @possible = PossibleTrainingDivision.new(user_id: 1, training_division_id: 1)
  end

  test "should be valid" do
    assert @possible.valid?
  end
end
