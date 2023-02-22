class UserCommentsController < ApplicationController
  def create
   @recipe = Recipe.find(params[:recipe_id])
   @comment = current_user.user_comments.new(user_comment_params)
   @comment.recipe_id = @recipe.id
   @comment.save
   #if @comment.save
   #flash.now[:notice] = 'コメントを投稿しました'
    #  render :recipe_comments
   #else
    #  render 'recipes/show'
   #end
    
  end
  
  def destroy
      
     @comment = UserComment.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
     @recipe = Recipe.find(params[:recipe_id])  
     #render :recipe_comment
  end
  
   private

  def user_comment_params
    params.require(:user_comment).permit(:comment)
  end
  
  
end
