class ArticlesController < ApplicationController
  
  before_action :require_user_logged_in, only: [:new, :create, :destroy, :edit, :update, :show]
   before_action :correct_user, only: [:destroy, :edit, :update]
  
  def index
   @articles = Article.search(params[:search])
  end
  

  def show
    @article = Article.find(params[:id])
  end
 

  def new
    @article = Article.new
  end


  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = '記事をを投稿しました。'
      redirect_to user_path(current_user)
    else
      @articles = current_user.articles.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '記事のの投稿に失敗しました。'
      render new_article_path
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash[:success] = 'この記は削除されました'
    redirect_to user_path(current_user)
    
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:success] = '記事の編集 は正常に実行されました'
      redirect_to @article
    else
      flash.now[:danger] = '記事の編集 に失敗しました'
      render :edit
    end
  end
  
  
  
  private

  
  def article_params
    params.require(:article).permit(:content, :title, :keyword, :category_id, :bibilography, :slideshare_embed, :movie, :eyecatch)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      redirect_to root_url
  end
  
end
  
end
