class IdeasController < ApplicationController
  def show
    @current_user = User.find(session[:user_id])
    @user_idea = Idea.joins(:user).select("users.name","ideas.idea","ideas.id","users.id as userid")
    @likes = Like.all
    render '/ideas/show'
  end
  def create
    @current_user = User.find(session[:user_id])
    Idea.create(idea: params[:idea], user: User.find(@current_user.id))
    redirect_to :back
  end
  def showid
    @current_user = User.find(session[:user_id])
    @idea = Idea.joins(:user).select("users.name","ideas.idea","ideas.id","users.id as userid").where("ideas.id = ?", params[:id])
    @likers = Like.joins(:user).select("users.name","users.alias","users.id").where("likes.idea_id = ?", params[:id])
    @user_likes = User.find(@current_user).ideas_liked
    render 'ideas/idea'
  end
  def destroy
    Idea.find(params[:id]).destroy
    redirect_to :back
  end
end
