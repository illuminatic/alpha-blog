class ArticlesController < ApplicationController
  #with the before_action you use the following set_article method to have the @article ready
  # for edit, update, show and destroy action
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    debugger
    @article = Article.new(article_params)
    # that line help to have an user for the model
    @article.user = User.first

    if @article.save
      flash[:success] = "Article was succefully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Artile was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successefully destroid"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end