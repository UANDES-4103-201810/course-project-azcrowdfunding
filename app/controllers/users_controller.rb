class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def show_all
    @users = User.all
  end
end
