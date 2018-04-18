class LikesController < ApplicationController
    def create
         Like.create(user:current_user, secret:Secret.find(params[:secret_id]))
         redirect_to '/secrets'
    end

    def destroy
        p "1================="
        p (params[:id])
        p Secret.find(params[:id])
        @like = Like.find_by(user:current_user, secret:Secret.find(params[:id]))
        @like.destroy if @like
        redirect_to '/secrets'
    end
end
