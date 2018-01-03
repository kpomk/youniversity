class CategoriesController < ApplicationController
  
  def index
    #@articles= Article.find(params[:category_id])
    @articles= Article.where(category_id: params[:category_id])
    @category= Category.find(params[:category_id])
    #@article = Article.find(params[:id])
  end
end
