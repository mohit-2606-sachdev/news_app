class ArticleController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :authorize_editor, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to article_path, notice: 'Article was successfully destroyed.'
  end

  private

  def authorize_editor
    unless current_user.has_role?(:editor)
      redirect_to root_path
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtopic, :content, :category_id, images:[])
  end
end
