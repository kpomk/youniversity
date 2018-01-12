class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:wants, :likes]
 
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.all
    @count_want = @user.want_articles.count
    @ranking_counts = Want.ranking
    @want_articles = Article.find(@ranking_counts.keys)
    @ranking_counts = Like.ranking
    @like_articles = Article.find(@ranking_counts.keys)
    #@like_articles = Article.where(id: @ranking_counts.keys).page(params[:page]).per(4)
    #@article = Article.find(params[:article_id])
    
  end

  def new
    @user = User.new
   
  end

  def create
    #binding.pry
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = '退会しました'
    redirect_to root_path
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'プロフィールの編集 が完了しました'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィール編集に失敗しました'
      render :edit
    end
  end
  
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :belonging, :major, :publication)
  end
  
  
end
