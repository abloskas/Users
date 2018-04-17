class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
   
    p @user
    if @user
      p session[:user_id] = @user.id
      p "================================"
      p "/users/#{@user.id}"
      redirect_to "/users/#{@user.id}"
    else 
      flash[:errors] = ["Invalid"] 
      redirect_to '/sessions/new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end


end
