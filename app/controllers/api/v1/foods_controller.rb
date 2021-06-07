module Api
  class V1::FoodsController < ApplicationController
    # GET /foods
    def index
      @foods = Food.all
      render json: {
        data: {
          foods: @foods
        }
      }
    end

    # GET /food/:id
    def show
      @food = Food.find(params[:id])
      render json: {
        data: {
          food: @food
        }
      }
    end
  end
end
