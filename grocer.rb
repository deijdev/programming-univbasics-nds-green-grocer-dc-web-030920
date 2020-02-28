

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
   coupons_index = 0

  while coupons_index < coupons.size do
    current_coupon = coupons[coupons_index]
    applicable_for_discount = find_item_by_name_in_collection( current_coupon[:item], cart )
      if ( applicable_for_discount[:count] / current_coupon[:num] >= 1 )
        cart.push( {:item => "#{current_coupon[:item]} W/COUPON",
                    :price => (current_coupon[:cost] / current_coupon[:num]).round(2),
                    :clearance => applicable_for_discount[:clearance],
                    :count => applicable_for_discount[:count] - ( applicable_for_discount[:count] % current_coupon[:num])})

        applicable_for_discount[:count] %= current_coupon[:num]
      end
    coupons_index += 1
  end
  cart
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
