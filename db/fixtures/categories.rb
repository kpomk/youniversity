# Category.seed(:id) do |s|
#   s.id = 1
#   s.category_name = "臨床心理学"
# end
# Category.seed(:id) do |s|
#   s.id = 2
#   s.category_name = "社会心理学"
# end
 
# Category.seed(:id) do |s|
#   s.id = 3
#   s.category_name = "組織心理学"
# end

# Category.seed(:id) do |s|
#   s.id = 4
#   s.category_name = "生理心理学"
# end

# 幾つも類似したコードを書くと、問題に気づきにくいので、
# DRYな記述を意識しましょう
#御意
Category.seed(:id,
  { :id => 1, :category_name => "文学" },
  { :id => 2, :category_name => "心理学" },
  { :id => 3, :category_name => "社会学" },
  { :id => 4, :category_name => "経営学" },
  { :id => 5, :category_name => "教育学" },
  { :id => 6, :category_name => "医学" },
  { :id => 7, :category_name => "農学" },
  { :id => 8, :category_name => "栄養学" },

)