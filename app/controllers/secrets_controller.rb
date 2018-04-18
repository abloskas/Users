class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    @secret = Secret.new
    @secret.content = params[:secret][:content]
    @secret.user = current_user
    unless @secret.save
      flash[:errors] = @secret.errors.full_messages
    end
    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    @secret = Secret.find(params[:id])
    if @secret.user == current_user
      @secret.destroy
    end
    redirect_to "/users/#{current_user.id}"
  end
end
