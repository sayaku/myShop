FactoryGirl.define do

  #製作範例資料
  #使用方法FactoryGirl.build(:product)	
  factory :product do
     title        Faker::Name.title #預設是title "MyString"，但這樣太制式了，所以我們可以用Faker這個套件
     description  Faker::Lorem.paragraph            #預設是"MyText"
     price        Faker::Number.between(10, 1000)


     #trait :ruby_book do
     #	title "rubybook"
     #end
     #上面的寫法相當於下面factory :ruby_book, class: Product do那一整個區塊的寫法
     #很方便
     #使用方法是FactoryGirl.build(:product, :ruby_book)


  end
#使用方法FactoryGirl.build(:ruby_book)
  factory :ruby_book, class: Product do
     title  "rubybook"      
     description  Faker::Lorem.paragraph 
     price       Faker::Number.between(10, 1000)
  end
end
