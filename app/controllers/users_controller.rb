class UsersController < ApplicationController
 before_action :authenticate_user!
    before_action :set_user, only: [:favorites,:out]
    before_action :correct_user, only: [:edit, :update]
  def show
     @user = User.find(params[:id])
     @recipes = @user.recipes.published
     @reciped = @user.recipes.unpublished
     # @random = Recipe.where( 'id >= ?', rand(Recipe.first.id..Recipe.last.id) )&.first
     #ランダムで公開済みの投稿された内容を引っ張ってくる
     random_id = Recipe.published.ids.sample
     if random_id.present?
      @random = Recipe.find(random_id)
     else
      @random = nil
     end
     
     @likes = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  
    
     
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
    @user.destroy
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
   end
 	#いいねした投稿の一覧に移動する
 	
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:recipe_id)
    @favorite_recipes = Recipe.find(favorites)
  end
 	
   private
   
   def set_user
   @user = User.find_by(:id => params[:id])
   end
   
  def user_params
    params.require(:user).permit(:name, :profile_image, :message)
  end
  
   def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
   end
  
  
  
  
end
