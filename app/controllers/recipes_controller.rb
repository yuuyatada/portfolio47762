class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
   @recipes = Recipe.all
  end

  def show
   @recipe = Recipe.find(params[:id])
  end

  def edit
   @recipe = Recipe.find(params[:id])
  end

  def create
     recipe = Recipe.new(recipe_params)
     recipe.save
     redirect_to '/recipes'
    
    
  end

  def update
  end

  def destroy
  end
  
  
   private
   
  def recipe_params
    params.require(:recipe).permit(:title, :main_text)
  end
  
  
end
