class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(name:params[:name], email:params[:email], password:params[:password], password_confirmation:params[:confirm])
        if @user.save
            session[:user_id] = @user.id
<<<<<<< HEAD
            redirect_to "/sessions/new"
        else 
            flash[:errors] = ["can't be blank"] 
=======
            redirect_to "users/#{@user.id}"
        else 
            flash[:errors] = ["Invalid"] 
>>>>>>> 87b2f7d466574525a47b81e3a452363574748fb1
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
