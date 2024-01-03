class ArticleController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  # before_action :authorize_editor, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    # @articles = Article.includes(:category ,:user)
    # render json: @articles.to_json(include: {category:{} , user:{}})
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    # @article = current_user.articles.build(article_params)
    @article = Article.new(article_params)

    if @article.save
      render json: @article , status: :ok
      # redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def new
    @article = Article.new
    render json: @article
  end

  def edit
    render json: @article,status: :ok
  end

  def update
    if @article.update(article_params)
      render json: @article , status: :ok
      # redirect_to @article, notice: 'Article was successfully updated.'
      # render "Successfully updated"
    else
      render :edit
    end
  end

  def destroy
    render json: @article , status: :no_content
    @article.destroy
    # redirect_to article_path, notice: 'Article was successfully destroyed.'
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
