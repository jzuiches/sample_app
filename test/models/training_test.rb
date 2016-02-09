require 'test_helper'

class TrainingTest < ActiveSupport::TestCase
  def setup
    @user = users(:joseph)
    @training_division = training_divisions(:beacons)
    # @training_division = TrainingDivision.create!(training_type: "beacon", user_id: @user.id)
    @training = @user.trainings.build(location: "Red Dog", trainer: "Lel",training_division_id: @training_division.id, training_date: 1/2/2016)
  end

  test "should be valid" do
    assert @training.valid?
  end

  # test "should have id nil" do
  #   @training.id = nil
  #   assert_not @training.valid?
  # end

  test "user id should be present" do
    @training.user_id = nil
    assert_not @training.valid?
  end


  test "training division should be present" do
    @training.training_division = nil
    assert_not @training.valid?
  end

  test "order should be most recent first" do
    assert_equal trainings(:most_recent), Training.first
  end

end
