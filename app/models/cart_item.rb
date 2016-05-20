#檔名有限制，例如CartItem，在rails裡的檔名慣例會是cart_item

class CartItem

   attr_accessor :product_id, :count

   def initialize(_id, num = 1)
   	  @product_id = _id
      @count = num
   end

   def increment
   	   @count += 1
   end

   def product
   	  Product.find_by(id: product_id)
   end

   def total_price
   	  product().price * count
   end

end	