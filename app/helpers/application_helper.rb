module ApplicationHelper
 
 # def eyecatch_image(article)
   # gazou = article.eyecatch.present? ? article.eyecatch.url : asset_path("half-main-imgbox6.png")
   # image_tag(gazou, size: "160x160")
  #end
 
  
  def qiita_markdown(markdown)
    processor = Qiita::Markdown::Processor.new(hostname: "example.com")
    processor.call(markdown)[:output].to_s.html_safe
  end
  
end
