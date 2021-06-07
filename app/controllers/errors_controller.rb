class ErrorsController < ApplicationController
  def not_found
    render text: 'Not Found', status: 404
  end

  def forbidden
    render json: {
      error: 'Require login'
    }, status: 403
  end

  def internal_error
    render text: 'Internal server error', status: 500
  end
end