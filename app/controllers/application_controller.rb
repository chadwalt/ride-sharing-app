class ApplicationController < ActionController::Base
  # Public: Respond with json.
  #
  # message - The String representation of the response.
  # status_code - The Symbol of the status code for the HTTP Resource
  #
  # Returns a json response
  def respond_with_json(message, status_code)
    respond_to do |format|
      format.json { render json: { message: message }, status: status_code }
    end
  end
end
