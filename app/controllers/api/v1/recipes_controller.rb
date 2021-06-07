module Api
  class V1::RecipesController < ApplicationController
    # GET /recips
    def index
      @recipes = Recipe.all
      render json: {
        data: {
          recipes: @recipes
        }
      }
    end

    # GET /recips/:id
    def show
      @recipe = Recipe.find(params[:id])
    end
  end
end
