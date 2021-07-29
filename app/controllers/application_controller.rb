class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  # def invalid_record(exception)
  #   render json: { error: exception.message }, status: :bad_request
  # end

  def record_not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
