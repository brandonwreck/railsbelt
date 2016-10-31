class UsersController < ApplicationController
  def index
    render 'users/index'
  end
  def logout
    @current_user = nil
    reset_session
    redirect_to  '/main'
  end
  def create
    u = User.new(user_params)
    if u.save
      flash[:success] = "New user created Successfully"
      redirect_to :back
    else
      flash[:failed] = u.errors.full_messages
      redirect_to :back
    end
  end
  def show
    @user = User.find_by_id(params[:id])
    @idea = Idea.where(user: User.find(params[:id])) 
    @like = Like.where(user: User.find(params[:id]))
    render 'users/show'

  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :alias, :password)
    end
end
