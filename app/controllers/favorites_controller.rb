class FavoritesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :recipe_params, only: [:create, :destroy]
def create
  #@recipe = Recipe.find(params[:recipe_id])
  #favorite = current_user.favorites.new(recipe_id: @recipe)
  #recipe_favorite.save
 Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
end

def destroy
  #@recipe = Recipe.find(params[:recipe_id])
  #recipe_favorite = current_user.favorites.find_by(recipe_id: @recipe)
  #recipe_favorite.destroy
 favorite = Favorite.find_by(user_id: current_user.id, recipe_id: @recipe.id)
 favorite.destroy
end
   private
  def recipe_params
    @recipe = Recipe.find(params[:recipe_id])
  end
    
end
