require 'test_helper'

class TrainingsControllerTest < ActionController::TestCase

  def setup
    @training = trainings(:beacon)
  end

  test "should redirect if user not logged in" do
    assert_no_difference "Training.count" do
      post :create, micropost: { location: "Red Dog", trainer: "Lel", training_division_id: 1 }
    end
    assert_redirected_to login_url
  end

  test "should redirect if user tries to destroy without being logged in" do
    assert_no_difference 'Training.count' do
      delete :destroy, id: @training
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong training" do
    log_in_as(users(:joseph))
    training = trainings(:beacon)
    assert_no_difference "Training.count" do
      delete :destroy, id: training
    end
    assert_redirected_to root_url
  end

end
