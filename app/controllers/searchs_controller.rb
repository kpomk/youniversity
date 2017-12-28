class SearchsController < ApplicationController
  
  def index
    
  end

  def new
    @articles = []
    
    @keyword = params[:keyword]
       if @keyword.present? # 
       results = Article.search({keyword: @keyword})
       
       results.each do |result|
         article = Article.find_or_initialize_by(read(result))
        @articles << article
        end
      end
  end
  private

  def read(result)
    keyword = result['article.keyword']
    

    return {
      keyword: keyword,
      
    }
  end
  
end
