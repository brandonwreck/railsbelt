class LikesController < ApplicationController
  def create
    @current_user = User.find(session[:user_id])
    Like.create(user: @current_user, idea_id: params[:idea])
    redirect_to :back
  end
end
