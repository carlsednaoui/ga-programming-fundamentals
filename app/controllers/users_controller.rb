
class UsersController < ApplicationController
before_filter :admin_auth, :only => [:index, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def apply
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.json { render json: {"message" => "Application submited. Thank you."}.to_json, status: :created }
      else
        format.json { render json: {"message" => "Application failed, please try again."}.to_json, status: 400}
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  protected

  # Basic HTML Authentication to view users
  def admin_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "ga" && password == "ga"
    end
  end

end