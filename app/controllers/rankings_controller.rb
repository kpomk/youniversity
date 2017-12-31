class RankingsController < ApplicationController
  
  def index
    article_id = Like.group(:article_id).order("count_all desc").count.first.first
    @articles=Article.find(article_id)
  end
  
  def want
    @ranking_counts = Want.ranking
    # @arricles = Article.find(@ranking_counts.keys) #タイプミス?
    @articles = Article.find(@ranking_counts.keys)
  end

  def like
    @ranking_counts = Like.ranking
    # @arricles = Article.find(@ranking_counts.keys) #タイプミス?
    @articles = Article.find(@ranking_counts.keys)
    @ranking_articles = Article.where(id: @ranking_counts.keys).page(params[:page]).per(12)
  end
end
