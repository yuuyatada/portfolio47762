class UserCommentsController < ApplicationController
  def create
   recipe = Recipe.find(params[:recipe_id])
   comment = current_user.user_comments.new(user_comment_params)
   comment.recipe_id = recipe.id
   comment.save
   redirect_to recipe_path(recipe)
    
  end
  
  def destroy
      
     comment = UserComment.find_by(id: params[:id], recipe_id: params[:recipe_id])
     comment.destroy
     redirect_to recipe_path(params[:recipe_id])
  end
  
   private

  def user_comment_params
    params.require(:user_comment).permit(:comment)
  end
  
  
end
