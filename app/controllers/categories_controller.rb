class CategoriesController < ApplicationController
  
  def index
    #@articles= Article.find(params[:category_id])
    @articles= Article.all(params[:category_id])
  end
end
