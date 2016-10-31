class SessionsController < ApplicationController
  def create
    u = User.find_by_email(params[:email])
    if(u && u.authenticate(params[:password]))
      session[:user_id] = u.id
      redirect_to '/bright_ideas'
     else
      flash[:loginfailed] = "Login unsuccessful"
      redirect_to :back
    end
  
  end
end
