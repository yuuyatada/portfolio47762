class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
   @recipes = Recipe.all
  end

  def show
   @recipe = Recipe.find(params[:id])
   @user_comment = UserComment.new
   
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
       @recipe = Recipe.find(params[:id])
     
	if  @recipe.update(recipe_params)
  	flash[:success] = "登録情報を変更しました"
		redirect_to recipe_path(@recipe.id)
	else
  	render :edit and return
 	end
  end

  def destroy
  end
  
  
   private
   
  def recipe_params
    params.require(:recipe).permit(:title, :main_text, :recipe_image).merge(user_id: current_user.id)
  end
  
  
end
