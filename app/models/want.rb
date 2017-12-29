class Want < Ownership
  def self.ranking
    self.group(:article_id).order('count_article_id DESC').limit(10).count(:article_id)
  end
end
