class ToppagesController < ApplicationController
  skip_before_action :require_user_logged_in
  
  def index
    article_id = Like.group(:article_id).order("count_all desc").count.first.first
    @articles=Article.find(article_id)
    #@articles= Article.all.page(params[:page]).per(6)
     @items = Article.all
  end
end
