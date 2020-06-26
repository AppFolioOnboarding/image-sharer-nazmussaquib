require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'feedback is created' do
    assert true
    feedback = Feedback.create!(name: 'wally', feedback: 'where is he?')
    assert_equal 'wally', feedback.name
    assert_equal 'where is he?', feedback.feedback
  end
end
