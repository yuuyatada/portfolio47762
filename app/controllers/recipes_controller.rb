class RecipesController < ApplicationController
     before_action :correct_user, only: [:edit, :update]
  def new
    @recipe = Recipe.new
  end

  def index
   @recipes = params[:id] ? Breed.find(params[:id]).recipes : Recipe.published
   @breeds = Breed.all
   
  end

  def show
   @recipe = Recipe.find(params[:id])
   @comment = UserComment.new
   
  end

  def edit
   @recipe = Recipe.find(params[:id])
  end

  def create
     recipe = Recipe.new(recipe_params)
     if recipe.save
     redirect_to '/recipes'
     else
     render :new
     end
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
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
   
  end
  
  
   private
   
  def recipe_params
    params.require(:recipe).permit(:title, :main_text, :recipe_image,:is_active,:breed_id).merge(user_id: current_user.id)
  end
  
  def correct_user
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    redirect_to(recipes_path) unless @user == current_user
  end
  
  
end
