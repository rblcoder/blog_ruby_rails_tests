class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :destroy, :show] 

	def index 
		@articles = Article.all			
	end

	def show
		# @article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

  def create 
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other  
  end

  def set_article 
    @article = Article.find(params[:id])
  end

  protected
    def resource_not_found
      message = "The article you are looking for could not be found" 
      flash[:alert] = message
      redirect_to root_path
    end

  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

    
end
