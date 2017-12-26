class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_user_logged_in
  
   include SessionsHelper

   def counts(article)
    @count_articles = user.articles.count
    @count_want = user.wants.count
    @count_likes = user.likes.count
  end



  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
