def find_item_by_name_in_collection(name, collection)
  counter=0 
  
  while counter < collection.length do 
   if collection[counter][:name]==name
     return collection[counter]
    end
  counter +=1
  end
end

def consolidate_cart(cart)
   consCart = {}
  cart.map { |groc|
    grocItem = groc.keys[0]
    if consCart[grocItem]
      consCart[grocItem][:count] += 1
    else
      consCart[grocItem] = groc[grocItem]
      consCart[grocItem][:count] = 1
    end
  }
  consCart
end	

def apply_coupons(cart, coupons)
  counter = 0 
  
  while counter < coupons.length
  cart_item=find_item_by_name_in_collection(coupons[counter][:item], cart)
  couponed_item_name= "#{coupons[:counter][:item]} W/ COUPON"
  cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
  if cart_item && cart_item[:count]>= coupons[counter][:num]
    if cart_item_with_coupon
      cart_item_with_coupon[:count] += 1 
    end
  end
  
  counter +=1
end
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
