class UsersController < ApplicationController
    before_action :set_user, only: [:favorites]
    
    
  def show
     @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     
	if  @user.update(user_params)
  	flash[:success] = "登録情報を変更しました"
		redirect_to user_path(@user.id)
	else
  	render :edit and return
 	end
  end

  def quit
       @user = current_user
  end
  
   def out
       @user = current_user
     
	if @customer.update(user_params)
  	flash[:success] = "登録情報を変更しました"
	   redirect_to user_path(@customer.id)
	else
  	render :edit and return
 	end
 	
 	#いいねした投稿の一覧に移動する
 	
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:recipe_id)
    @favorite_recipes = Recipe.find(favorites)
  end
 	
   end
  
   private
   
   def set_user
    @user = User.find(params[:id])
   end
   
  def user_params
    params.require(:user).permit(:name, :profile_image, :message)
  end
  
  
  
  
  
  
end
