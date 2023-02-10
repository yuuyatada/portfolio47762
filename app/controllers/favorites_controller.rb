class FavoritesController < ApplicationController
    
def create
  @recipe = Recipe.find(params[:recipe_id])
  recipe_favorite = Favorite.new(user_id: current_user.id, recipe_id: params[:recipe_id])
  recipe_favorite.save
  redirect_to recipe_path(params[:recipe_id]) 
  
end

def destroy
  @recipe = Recipe.find(params[:recipe_id])
  recipe_favorite = Favorite.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
  recipe_favorite.destroy
  redirect_to recipe_path(params[:recipe_id]) 
end
    
    
end
