class UsersController < ApplicationController
 before_action :correct_user, only: [:edit, :update]
  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books=@user.books
  end
  def edit
  @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
     render :edit
    end
  end
   private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end
end