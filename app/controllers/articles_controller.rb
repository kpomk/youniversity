class ArticlesController < ApplicationController
  include ApplicationHelper
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

  # POST /pages
  # POST /pages.json
  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: '記事をを投稿しました。' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #def create
    #@article = current_user.articles.build(article_params)
    #if @article.save
      #flash[:success] = '記事をを投稿しました。'
      #redirect_to user_path(current_user)
    #else
     # @articles = current_user.articles.order('created_at DESC').page(params[:page])
      #flash.now[:danger] = '記事のの投稿に失敗しました。'
     # render new_article_path
   # end
 # end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash[:success] = 'この記は削除されました'
    redirect_to user_path(current_user)
    
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: '記事の編集が完了しました' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article .errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  #def update
   # @article = Article.find(params[:id])
    
    #if @article.update(article_params)
     # flash[:success] = '記事の編集 は正常に実行されました'
      #redirect_to @article
  #  else
     # flash.now[:danger] = '記事の編集 に失敗しました'
    #  render :edit
   # end
  #end
  def api_markdown
    
    markdown = qiita_markdown(params[:text])
    
    pp markdown
    #render plain: markdown　#どちらでもできた
    render text: markdown
  end
  
  
  private

  
  def article_params
    params.require(:article).permit(:content, :title, :keyword, :category_id, :bibilography, :slideshare_embed, :movie, :eyecatch, :remove_eyecatch,:remove_movie)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      redirect_to root_url
  end
  
  
  end
  
end
