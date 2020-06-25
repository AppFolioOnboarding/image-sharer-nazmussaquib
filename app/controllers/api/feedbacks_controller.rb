module Api
  class FeedbacksController < ApplicationController
    def create
      # Implement your create action
      Feedback.create!(feedback_params)
      head :no_content
    end

    private

    # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit(:name, :feedback)
    end
  end
end
