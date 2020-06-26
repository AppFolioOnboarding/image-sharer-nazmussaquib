require 'test_helper'

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  test 'should get feedback form container' do
    get new_feedback_path
    assert_response :success
    assert_select '#feedback-root'
  end
end
