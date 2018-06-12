class UsersController < ApplicationController
  # before_action :isadmin?, :only[:index, :create, :edit, :show, :update]
  def show
    @user = User.find(params[:id])
    @projects = @user.projects.count
    @founded = @user.contributions.where(status: true).count
    @founded += @user.finance.where(status: true).count
    @waiting = @user.contributions.where(status: false).count
    @waiting += @user.finance.where(status: false).count
  end

  def show_all
    @users = User.all
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def new_facebook
    aux = User.find_by_email(params[:info][:email])
    if aux
      sign_in_and_redirect aux, success: 'Successfully signed up through Facebook'
    end
    @user = User.new
    @user.uid = params[:uid]
    @user.provider = params[:provider]
    info = params[:info]
    @user.email = info[:email]
    @user.first_name = info[:first_name]
    @user.last_name = info[:last_name]
    @user.password = Devise.friendly_token[0, 20]
  end

  def create
    @user = User.new(user_params)
    @user.print
    puts @user.valid?
    if @user.save
      if !(@user.provider.nil?)
        sign_in_and_redirect @user, success: 'Successfully signed up through Facebook'
      else
        redirect_to root_path, success: 'Successfully signed up'
      end
    else
      redirect_to root_path, danger: 'Log in through Facebook was not successful'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    if @user.update(user_params)
      flash[:info] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "Successfully deleted User."
      redirect_to root_path
    end
  end

  def download_file
    user = User.find_by(id: params[:id])
    if user.avatar.exists?
      send_file user.avatar.path
    else
      redirect_to user_path(user), warning: "No Image Found";
    end
  end


  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :markdown, :outstanding, :main_image, :avatar,:phone, :address, :country, :city, :avatar_file_name, :avatar_content_type, :avatar_file_size, :admin, :password, :password_confirmation)
  end


end
