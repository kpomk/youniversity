class OwnershipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @article = Article.find(params[:article_id])
    
    if params[:type] == 'Want'
      current_user.want(@article)
      flash[:success] = 'あとでみる'
      redirect_back(fallback_location: root_path)
      
    else
      params[:type] == 'Like'
      current_user.like(@article)
      flash[:success] = 'いいね！'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    
    if params[:type] == 'Want'
      current_user.unwant(@article)
      flash[:success] = 'あとで見るを解除しました。'
      redirect_back(fallback_location: root_path)
    
    else params[:type] == 'Like'
      current_user.unlike(@article)
      flash[:success] = 'いいねを解除しました。'
      redirect_back(fallback_location: root_path)
    end  
  end
end


