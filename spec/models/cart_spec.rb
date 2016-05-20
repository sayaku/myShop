require 'rails_helper'

#這邊定義測試的描述，我有一個東西叫Cart,他的型別是model
#實際上建的Cart應該會在app/model裡面建一個Cart.rb
RSpec.describe Cart, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #pending的意思是提醒你等一下要做的事，也可以不打，但打了可以提醒你,使用rspec時他會呈現紅字

  #定義描述區
  describe "購物車基本功能" do 

  	#it就是做測試，我期待有什麼行為
    it "可以新增商品到購物車裡，然後購物車裡就有東西" do 

    	#pp=Product.create(title:"rubyBook",price: 100)
    	#如果不想自己打資料可以用工廠女孩
        pp = FactoryGirl.create(:product)   #build跟create的差別是一個指事件出來放在空氣中，一個是建出來並存到資料庫
        cart = Cart.new
        cart.addItem(pp.id)

        #這邊是測試期待的結果,我期待有放東西進去後裡面應該是有東西的
        expect(cart.empty?).to be false
        
        #也可以反向測試
        cart2= Cart.new

        #這邊是測試期待的結果,我期待有放東西進去後裡面應該沒有東西的
        expect(cart2.empty?).to be true
        #測試的意義
        #要測試他的行為不要測試細節

    end

    it "如果加了相同種類的商品，購買項目(CartItem)並不會增加，但數量會改變。" do
        cart=Cart.new
        
        p1=FactoryGirl.create(:product)
        p2=FactoryGirl.create(:product)
        p3=FactoryGirl.create(:product)

        5.times { cart.addItem(p1.id) }
        3.times { cart.addItem(p2.id) }
        #這邊是測試期待的結果,購買項目(CartItem)並不會增加
        expect(cart.items.count).to be 2
        #然後再期待數量應該是5跟3
        expect(cart.getItemById(p1.id).count).to be 5
        expect(cart.getItemById(p2.id).count).to be 3



    end

    it "商品可以放到購物車裡，也可以再拿出來" do 

       cart=Cart.new
       p1= FactoryGirl.create(:ruby_book)
       cart.addItem(p1.id)

       #作期待
       expect(cart.getItemById(p1.id).product_id).to be p1.id #是否是p1這個實體的id
       expect(cart.getItemById(p1.id).product).to be_a Product #p1這個實體是否是Product
       expect(cart.getItemById(p1.id).product.title).to eq p1.title #p1這個標題是否相符


    end

    
    it "可以計算整個購物車的總消費金額" do 
       p1= FactoryGirl.create(:ruby_book)
       p2= FactoryGirl.create(:ruby_book)  
       cart=Cart.new
       5.times { cart.addItem(p1.id) }
       cart.addItem(p2.id)

       expect(cart.total_price).to eq 5*p1.price+p2.price #測測總數是否相同
       
    end

    it "聖誕節打九折" do

        
    end


  end

  describe "購物車進階功能" do 
    #* 可以將購物車內容轉換成 Hash
    #* 也可以把 Hash 還原成購物車的內容
  end


end
