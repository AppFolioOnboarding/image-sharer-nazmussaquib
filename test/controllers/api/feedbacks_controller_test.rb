require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'should create new feedback' do
    assert_difference('Feedback.count') do
      post api_feedbacks_url, params: { feedback: { name: 'lyf', feedback: 'do be lyk dat sumtym' } }
    end
    assert_response :no_content
  end
end
