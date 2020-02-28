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
  con_hash = {}
  cart.each do |item|
    item.each do |name, attribute|
      if con_hash.has_key?(name)
        con_hash[name][:count] += 1        
      else 
        con_hash = con_hash.merge({name => attribute.merge({count: 1})})
      end
    end
  end
  return con_hash
end	

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
