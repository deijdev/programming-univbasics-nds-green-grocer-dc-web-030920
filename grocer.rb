

def find_item_by_name_in_collection(name, collection)
  collection_index = 0

  while collection_index < collection.size do
    current_item = collection[collection_index]
    if ( current_item[:item] == name )
      return current_item
    end
    collection_index += 1
  end
 end

def consolidate_cart(cart)
     updated_cart = Array.new
  cart_index = 0

  while cart_index < cart.size do
    current_item = cart[cart_index]
    if ( find_item_by_name_in_collection( current_item[:item], updated_cart ) == nil)
      current_item[:count] = 1
      updated_cart.push(current_item)
    else
      increment_count_of_item( updated_cart, current_item[:item] )
    end
    cart_index += 1
  end
  updated_cart
end	

def apply_coupons(cart, coupons)
  coupCart = cart
  count = 0
  while coupons[count] do
    if cart[coupons[count][:item]]
      if cart[coupons[count][:item]][:count] >= coupons[count][:num]
        coupCart[coupons[count][:item]][:count] = coupCart[coupons[count][:item]][:count] - coupons[count][:num]
        coupItem = "#{coupons[count][:item]} W/COUPON"
        coupPrice = coupons[count][:cost] / coupons[count][:num]
        if coupCart[coupItem]
          coupCount = coupCart[coupItem][:count] + coupons[count][:num]
        else
          coupCount = coupons[count][:num]
        end
        coupCart[coupItem] = {:price => coupPrice, :clearance => coupCart[coupons[count][:item]][:clearance], :count => coupCount}
        count += 1
      else
        count += 1
      end
    else
      count += 1
    end
  end
  coupCart
end	  

def apply_clearance(cart)
   count = 0
  while cart.keys[count]
    item = cart.keys[count]
    if cart[item][:clearance]
      cart[item][:price] = (cart[item][:price] * 0.8).round(2)
      count += 1
    else
      count += 1
    end
  end
  cart
end	

def checkout(cart, coupons)
   consCart = consolidate_cart(cart)

  coupCart = apply_coupons(consCart, coupons)

  clearCart = apply_clearance(coupCart)

  total = 0
  count = 0
  while clearCart.keys[count]
    item = clearCart.keys[count]
    total += clearCart[item][:price] * clearCart[item][:count]
    count += 1
  end
  puts total
  if total > 100
    total *= 0.9
  end
  total
end	
