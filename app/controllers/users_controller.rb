class UsersController < ApplicationController
  
  def create
  	@user = User.new(params[:user])
  	respond_to do |format|
  		if @user.save
  			format.html {redirect_to users_url,
  				notice: "Welcome, #{@user.name}."}
  			format.json {render json: @user,
  				status: :created, location: @user }
  		else
  			format.html { render action: "new" }
  			format.json { render json: @user.erros,
  				status: :unprocessable_entity }
  		end
  	end
  end

  def update
  	@user = User.find(params[:id])
  	respond_to do |format|
  		if @user.update_attributes(params[:user])
  			format.html { redirect_to users_url, 
  				notice: "Change updated."}
  			format.json { head :no_content}
  		else
  			format.html { render action: "edit"}
  			format.json { render json: @user.errors,
  				status: :unprocessable_entity }
  		end
  	end
  end
  
  def new
  end

  def show
  	@user = User.find(params[:id])
  end
end
