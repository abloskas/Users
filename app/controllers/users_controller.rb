class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(name:params[:name], email:params[:email], password:params[:password], password_confirmation:params[:confirm])
        if @user.save
            session[:user_id] = @user.id
            redirect_to "users/#{@user.id}"
        else 
            flash[:errors] = ["Invalid"] 
            redirect_to '/users/new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    
    private
     def user_params
        params.require(:user).permit(:name, :email)
     end
end
