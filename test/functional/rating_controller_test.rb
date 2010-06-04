require 'test_helper'

class RatingControllerTest < ActionController::TestCase
  test "should get rate" do
    get :rate
    assert_response :success
  end

end
