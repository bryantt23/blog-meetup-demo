class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :destroy]

  def index
    @articles=Article.all
  end

  def new
    @article=Article.new
  end

  def create
    @article=Article.new(articles_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
  end

  def destroy

    @article.destroy

    redirect_to articles_path
  end


  private

  def articles_params
    params.require(:article).permit(:title, :body)
  end

  def find_article
    @article=Article.find(params[:id])
  end

end
