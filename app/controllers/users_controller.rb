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
 	
   end
  
   private
   
  def user_params
    params.require(:user).permit(:name)
  end
  
  
  
  
end
