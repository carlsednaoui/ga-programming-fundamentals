
class UsersController < ApplicationController
before_filter :admin_auth, :only => [:index, :destroy]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render json: "great success", status: :created, location: @user }
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def apply
    # respond_to do |format| 
    #   format.json { render json: "welcome to the application page \n" }
    # end

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

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  protected

  # Basic HTML Authentication to view users
  def admin_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "ga" && password == "ga"
    end
  end

end