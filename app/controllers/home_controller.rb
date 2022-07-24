class HomeController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    if Article.exists?(params[:id])
      @article = Article.find(params[:id])
    else
      redirect_to action: "index"
    end
  end

  def login
  end

  def authenticate
    if params[:username] == "admin" && params[:password] == "admin"
      session[:user] = "admin"
      redirect_to action: "index"
    else
      redirect_to action: "login"
    end
  end

  def logout
    session[:user] = nil
    redirect_to action: "index"
  end

end
