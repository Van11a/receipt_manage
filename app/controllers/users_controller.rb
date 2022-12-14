class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(User_params)
    if @user.save
      redirect_to user_path
    else
      render :new
    end
  end

  private
    def User_params
      params.require(:user)
      .permit(:login_id, :password, :sei, :mei, :sei_kana, :mei_kana)
    end

end
