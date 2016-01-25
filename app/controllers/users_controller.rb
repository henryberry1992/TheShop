class UsersController < ApplicationController
  
  def create
  	@user = User.new(user_params)
  	respond_to do |format|
  		if @user.save

  			format.html {
  				redirect_to @user
  				flash[:success] = "Welcome, #{@user.name}."}
  			format.json {render json: @user,
  				status: :created, location: @user }
  		else
  			format.html { render action: "new" }
  			format.json { render json: @user.errors,
  				status: :unprocessable_entity }
  		end
  	end
  end

  def update
  	@user = User.find(params[:id])
  	respond_to do |format|
  		if @user.update_attributes(params[:user])
  			format.html { redirect_to users_url, 
  				flash[:success] = "Change updated."}
  			format.json { head :no_content}
  		else
  			format.html { render action: "edit"}
  			format.json { render json: @user.errors,
  				status: :unprocessable_entity }
  		end
  	end
  end

  def index
  	@users = User.order(:name)
  	respond_to do |format|
  		format.html # index.html.erb
  		format.json { render json: @users }
  	end
  end
  
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation)
  	end
end
