class UsersController < ApplicationController

  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(params[:user])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully created."  
      redirect_to @user
    else      
      render "new"
    end
  end  

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Don't ask current user to sign in again after password changed
      bypass_sign_in @user
      flash[:notice] = "User successfully updated."  
      redirect_to @user
    else       
      render "edit"
    end    
  end
 
  def destroy
    User.find(params[:id]).destroy    
    flash[:notice] = "User successfully deleted."
    redirect_to users_path
  end


  private    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id)
    end

end
