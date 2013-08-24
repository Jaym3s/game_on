class RecipesController < ApplicationController
  before_filter :find_recipe, only: [:edit, :show]

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def show
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:title, :description, :instructions))
    if @recipe.save
      redirect_to recipes_path
    else
      render :edit
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find params[:id]
  end

end
