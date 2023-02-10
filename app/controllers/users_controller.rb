class UsersController < ApplicationController
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
  end
  
   def out
   end
  
   private
   
  def user_params
    params.require(:user).permit(:name)
  end
  
  
  
  
end
