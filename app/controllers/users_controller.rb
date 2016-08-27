class UsersController < ApplicationController
  def new
    @user=User.new
  end
   
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome To The AWSME Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end 
  def edit
    @user=User.find(params[:id])
    
  end
  def update
    
    if @user.update(user_params)
      flash[:success]="User Successfully Updated"
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end
  private
    def user_params
      params.require(:user).permit(:username, :email, :password) 
    end
 
end