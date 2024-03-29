class HomeController < ApplicationController
  
  def index
    @articles = Article.where(visible: session[:user] ? [true,false] : true).order('created_at DESC')
  end

  def login
  end

  def authenticate
    if User.exists?(username: params[:username])
      user = User.where(username: params[:username]).first
      if user.authenticate(params[:password])
        session[:user] = params[:username]
        redirect_to action: "index"
      else
        @message = "Credentials incorrect"
        render :login
      end
    else
      @message = "User not found"
      render :login
    end
  end

  def logout
    session[:user] = nil
    redirect_to action: "index"
  end

end
