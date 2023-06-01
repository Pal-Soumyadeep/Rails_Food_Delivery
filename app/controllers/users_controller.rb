class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[Current.user.id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to restaurants_path, notice: "Successfully created account"
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[Current.user.id])
  end

  def update
    @User = User.find_by(id: params[Current.user.id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = Restaurant.find(params[:id])
    @user.destroy

    redirect_to root_path, notice: "User Deleted"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :contact, :password, :password_confirmation)
  end
end
