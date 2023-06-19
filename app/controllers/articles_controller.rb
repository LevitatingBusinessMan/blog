class ArticlesController < ApplicationController
  before_action :require_login, except: [:show]
  skip_before_action :verify_authenticity_token, only: [:carpet,]

  def new
    @article = Article.new
  end

  def show
    if Article.exists?(id: params[:id], visible: session[:user] ? [true,false] : true)
      @article = Article.find(params[:id])
    else
      redirect_to action: "index"
    end
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  def carpet
    render plain: helpers.markdown(request.body.read)
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :visible)
    end
end
