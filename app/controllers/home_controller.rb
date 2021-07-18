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

end
