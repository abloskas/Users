class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    
    def new
    end

    def create
        @user = User.new(name:params[:name], email:params[:email], password:params[:password], password_confirmation:params[:confirm])
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/sessions/new"
        else 
            flash[:errors] = ["can't be blank"] 
            redirect_to '/users/new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        if @user.update(name:params[:name], email:params[:email])
        redirect_to "/users/#{@user.id}"
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{@user.id}/edit"
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        session[:user_id] = nil
        redirect_to "/users/new"
    end



    private
     def user_params
        params.require(:user).permit(:name, :email)
     end
end
