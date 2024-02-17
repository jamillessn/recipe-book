class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all.order :id
    end

    def new
        @recipe = Recipe.new
    end

    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            redirect_to recipes_path
        else
            render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :desc, :image_url)
    end
end
