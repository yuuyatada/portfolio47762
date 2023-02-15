class RecipesController < ApplicationController
    
  def new
    @recipe = Recipe.new
  end

  def index
   @recipes = params[:id] ? Breed.find(params[:id]).recipes : Recipe.published
   @breeds = Breed.all
   
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
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
   
  end
  
  
   private
   
  def recipe_params
    params.require(:recipe).permit(:title, :main_text, :recipe_image,:is_active, breed_ids: []).merge(user_id: current_user.id)
  end
  
  
end
