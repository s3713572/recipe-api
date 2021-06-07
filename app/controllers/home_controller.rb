class HomeController < ApplicationController
  def index
    render json: {
      message: 'Welcome to recipe share api V1'
    }
  end
end