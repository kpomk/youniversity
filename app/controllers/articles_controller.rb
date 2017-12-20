class ArticlesController < ApplicationController
  
  before_action :require_login, only: [:new, :create, :destroy, :edit, :update]
  
  def index
    @articles = Article.all　#　未定
  end

  def show
    @article = Articles.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
