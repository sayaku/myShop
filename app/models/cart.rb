class Cart # < ActiveRecord::Base #如果沒有要存到資料庫不一定要繼承這個,這種就叫純ruby類別
	
	attr_accessor :items

	def initialize
		@items =[]
	end

	def addItem(product_id)
		#先找到那個東西
		item = @items.find { |cartItem| cartItem.product_id == product_id }

		if item
		  #如果有的話數量加一
          item.increment
	    else
		  #沒有的話丟進去
		  @items << CartItem.new(product_id)
        end
		
	end

    def getItemById(product_id)
	    item = @items.find { |cartItem| cartItem.product_id == product_id }
    end

    def total_price
    	#total=0
    	#@items.each do |p|
    	#	total += p.total_price
    	#end

    	#total

    	#上面的寫法還有更精簡的寫法
    	items.reduce(0) { |sum, item| sum + item.total_price }
    end

    def priceOff(percent)
    	total_price * (percent / 100)
    end


	def empty?
		@items.empty?
	end

	private

    def xmas?
       Time.now.month == 12 && 	Time.now.day == 25
    end

end






