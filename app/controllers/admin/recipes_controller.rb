class Admin::RecipesController < ApplicationController
    before_action :authenticate_user!
    before_action :if_not_admin
    before_action :set_recipe, only: [:index, :show, :edit, :destroy]
    
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
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def recipe_params
    params.require(:recipe).permit(:title, :main_text, :recipe_image).merge(user_id: current_user.admin)
  end
  
  def set_recipe
    　　@recipe = Recipe.find(params[:id])
  end
end
