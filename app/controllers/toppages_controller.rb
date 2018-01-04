class ToppagesController < ApplicationController
  skip_before_action :require_user_logged_in
  
  def index
    article_id = Like.group(:article_id).order("count_all desc").count
    #@articles=Article.find(article_id)
    #@articles= Article.all.page(params[:page]).per(6)
    
    #@articles=Article.all.page(params[:page]).per(6)
    
    @newarrivals = Article.all.order('created_at DESC').page(params[:page]).per(4)
    
    @ranking_counts = Like.ranking
    @ranking_articles = Article.where(id: @ranking_counts.keys).page(params[:page]).per(4)
    
    if params[:category_id]
      @items = Article.where(category_id: params[:category_id])
    else
      @items = Article.all
    end
  end
  
  def newarrival
     @newarrivals = Article.all.order('created_at DESC').page(params[:page]).per(12)   
  end
  
end
